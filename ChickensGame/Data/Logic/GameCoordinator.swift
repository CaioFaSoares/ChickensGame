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
	
	@Published var combatManager = CombatManager()
	
	@Published var gameState: GameState = .combatIsOngoing
	@Published var selectableUpgrades: [EnviromentalAction] = []
	
	@Published var newestLog = ""
	
	@Published var currentCombatView: GameCoordinator?
	
	var anyCancellable: AnyCancellable? = nil
    
	init(view: CombatView? = nil) {
        self.player = Player(100,0)
        self.enemy = Enemy(100,0)
		
		let atk1 = PlayerAttackGenerator().generateBasicAttack()
		let atk2 = PlayerAttackGenerator().generateGodAttack()
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

extension GameCoordinator {
	
	func endTurn() {
		
		combatManager.incrementTurnCounterAndToggleEnemyState()
		
		if !player.isAlive {
			endCombatPlayerLost()
		} else if !enemy.isAlive {
			endCombatPlayerWon()
		}
		
		checkIfItsEnemyTurn()
		runCooldownDecrementorOnAllEnemyActiveActions()
		
	}
	
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
	
	func endCombatPlayerWon() {
		gameState = .combatHasBeenWon
		if selectableUpgrades.isEmpty { generateUpgradePaths() }
	}
	
	func generateUpgradePaths() {
		let upg1 = EnviromentalActionGenerator().generateFullHeal()
		let upg2 = EnviromentalActionGenerator().generateUpgradeToBasicAttack()
		
		selectableUpgrades.append(upg1)
		selectableUpgrades.append(upg2)
	}
	
	func endCombatPlayerLost() {
		gameState = .combatHasBeenLost
	}
	
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
	
}
