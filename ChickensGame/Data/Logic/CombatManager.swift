//
//  TurnGames.swift
//  ChickensGame
//
//  Created by Caio Soares on 31/03/23.
//

import Foundation

class CombatManager: ObservableObject {
    
    @Published var currentTurn = 0
    @Published var isEnemyTurn = false
	
	func incrementTurnCounterAndToggleEnemyState() {
		currentTurn += 1
		isEnemyTurn.toggle()
	}
	
	func enemyTurnDiceRoller(_ enemyAtks: [EntityAction]) -> EntityAction {
		let dice = Int.random(in: 1...enemyAtks.count) - 1
		return enemyAtks[dice]
	}
    
    init(currentTurn: Int = 0) {
        self.currentTurn = currentTurn
    }
    
}
