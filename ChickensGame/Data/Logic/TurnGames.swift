//
//  TurnGames.swift
//  ChickensGame
//
//  Created by Caio Soares on 31/03/23.
//

import Foundation

class FightManager: ObservableObject {
    
    @Published var currentTurn = 0
    
    
    
    func proceedToNextTurn() {
        currentTurn += 1
    }
    
    init(currentTurn: Int = 0) {
        self.currentTurn = currentTurn
    }
    
}
