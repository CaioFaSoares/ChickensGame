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
    
    func proceedToNextTurn() {
        currentTurn += 1
		isEnemyTurn = true
    }
	
	func enemyTurnDiceRoller(_ enemyAtks: [EntityAction]) -> EntityAction {
		let dice = Int.random(in: 0...enemyAtks.count)
		return enemyAtks[dice]
	}
    
    init(currentTurn: Int = 0) {
        self.currentTurn = currentTurn
    }
    
}
