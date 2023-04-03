//
//  PlayerEntity.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import Foundation

class Player: Entity {
    
    //Identifiables
    var identifier: String {
        return UUID().uuidString
    }
    
    var isAlive = Bool(true)
    
    //Player Default Stats
    let startingHP: Int
    let startingDP: Int
    
    //Player Maximum Stats
    @Published var maxHP: Int
    @Published var maxDP: Int
    
    //Player Current Stats
    @Published var currentHP: Int
    @Published var currentDP: Int
    
    //Player Score Progress
    @Published var currentScore: Int
    
    //Player Action Array
    @Published var activeActions: [EntityAction] = []
    
    init (
        _ startingHP: Int,
        _ startingDP: Int
    ) {
        
        self.startingHP = startingHP
        self.startingDP = startingDP
        
        self.maxHP = startingHP
        self.maxDP = startingDP
        
        self.currentHP = startingHP
        self.currentDP = startingDP
        
        self.currentScore = 0
    }
    
}

extension Player: Identifiable, Hashable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}
