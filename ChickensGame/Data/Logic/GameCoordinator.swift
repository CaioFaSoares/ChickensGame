//
//  GameManager.swift
//  ChickensGame
//
//  Created by Caio Soares on 31/03/23.
//

import Foundation
import Combine
import SwiftUI

class GameCoordinator: ObservableObject {
    
    //Entities initialization
    @Published var player: Player
    @Published var enemy: Enemy
    var enemyBaseStats: (Int, Int) = (8,0)
	
    //Turn manager and stuff
	@Published var combatManager = CombatManager()
    @Published var combatLevel: Int = 1
	
    //Turn manager and stuff
	@Published var gameState: GameState = .combatIsOngoing
	@Published var selectableUpgrades: [EnviromentalAction] = []
    @Published var nextCombatCyclePrepScreenIsShowing: Bool = false
	
	@Published var newestLog = ""
	
	@Published var currentCombatView: GameCoordinator?
    
    @Published var blurVal: CGFloat = 0
	
	var anyCancellable: AnyCancellable? = nil
    
	init(view: CombatView? = nil) {
        self.player = Player(12,2)
        self.enemy = Enemy(enemyBaseStats.0,enemyBaseStats.1)
		
		let atk1 = PlayerAttackGenerator().generateBasicAttack()
		let atk2 = PlayerAttackGenerator().generateDebugAttack()
        let atk3 = PlayerAttackGenerator().generateSkillHealing()
		
		self.player.activeActions.append(atk1)
		self.player.activeActions.append(atk2)
        self.player.activeActions.append(atk3)
		
		let eAtk1 = EnemyAttackGenerator().generateBasicAttack()
		let eAtk2 = EnemyAttackGenerator().generateStrongAttack()
		
		self.enemy.activeActions.append(eAtk1)
		self.enemy.activeActions.append(eAtk2)
		
		anyCancellable = self.player.objectWillChange.sink { [weak self] (_) in self?.objectWillChange.send() }
		anyCancellable = self.enemy.objectWillChange.sink { [weak self] (_) in self?.objectWillChange.send() }
		
		print("Game manager has been initialized")
    }
}

// COOLDOWN LOGIC

protocol CooldownLogic {
    func runCooldownDecrementorOnAllPlayerActiveActions()
    func runCooldownDecrementorOnAllEnemyActiveActions()
}

extension GameCoordinator: CooldownLogic {
	
	func runCooldownDecrementorOnAllPlayerActiveActions() {
		for act in player.activeActions where !act.isOffCooldown {
			act.processActionInternalCooldown()
			print("\(act.internalName) + \(act.isOffCooldown) + \(act.turnsLeftUntilIsOffCooldown)")
		}
	}
	
	func runCooldownDecrementorOnAllEnemyActiveActions() {
		for act in enemy.activeActions where !act.isOffCooldown {
			act.processActionInternalCooldown()
			print("\(act.internalName) + \(act.isOffCooldown) + \(act.turnsLeftUntilIsOffCooldown)")
		}
	}
	
}

// TURN LOGIC

protocol TurnLogic {
    func checkIfItsEnemyTurn()
    func initEnemyTurn()
    func endTurn()
    func endCombatPlayerWon()
    func endCombatPlayerLost()
}

extension GameCoordinator: TurnLogic {
    
    func checkIfItsEnemyTurn() {
        if combatManager.isEnemyTurn {
            initEnemyTurn()
        }
    }
    
    func initEnemyTurn() {
        let validActions = enemy.activeActions.filter { $0.isOffCooldown }
        let rolledForAction = combatManager.enemyTurnDiceRoller(validActions)
        casterEntityActingUponTargetEntity(action: rolledForAction, caster: enemy, target: player, gMan: self)
        runCooldownDecrementorOnAllPlayerActiveActions()
    }
    
    func endTurn() {
        
        combatManager.incrementTurnCounterAndToggleEnemyState()
        
        if !player.isAlive {
            endCombatPlayerLost()
        } else if !enemy.isAlive {
            runCooldownDecrementorOnAllPlayerActiveActions()
            endCombatPlayerWon()
        }
        
        if enemy.isAlive {
            checkIfItsEnemyTurn()
        }
        
        runCooldownDecrementorOnAllEnemyActiveActions()
        
    }
    
    func endCombatPlayerWon() {
        gameState = .combatHasBeenWon
        blurVal = 5
        if selectableUpgrades.isEmpty { generateUpgradePaths() }
    }
    
    func endCombatPlayerLost() {
        gameState = .combatHasBeenLost
        blurVal = 5
    }
    
}

// UPGRADES

protocol UpgradesLogic {
    func generateUpgradePaths()
    func upgradeWasChosen()
}

extension GameCoordinator: UpgradesLogic {
    
    func generateUpgradePaths() {
        let upg1 = EnviromentalActionGenerator().generateFullHeal()
        let upg2 = EnviromentalActionGenerator().generateUpgradeToBasicAttack()
        
        selectableUpgrades.append(upg1)
        selectableUpgrades.append(upg2)
    }
    
    func upgradeWasChosen() {
        selectableUpgrades = []
        initNextCombatCycle()
    }
    
}

// COMBAT CYCLE LOGIC

protocol CombatCycleLogic {
    func initNextCombatCycle()
}

extension GameCoordinator: CombatCycleLogic {
    
    func initNextCombatCycle() {
        self.player.updateMaxHP(deltaMaxHP: 1)
        self.enemyBaseStats.0 += 2
        self.enemyBaseStats.1 += 1
        
        self.enemy = Enemy(enemyBaseStats.0,enemyBaseStats.1)
        
        let eAtk1 = EnemyAttackGenerator().generateBasicAttack()
        let eAtk2 = EnemyAttackGenerator().generateStrongAttack()
        
        self.enemy.activeActions.append(eAtk1)
        self.enemy.activeActions.append(eAtk2)
        
        self.combatLevel += 1
        self.combatManager.currentTurn = 0
        self.combatManager.isEnemyTurn = false
        self.gameState = .combatIsOngoing
        blurVal = 0
        nextCombatCyclePrepScreenIsShowing = true
    }
    
}
