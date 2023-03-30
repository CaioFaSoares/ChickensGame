//
//  EnemyEntity.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import Foundation

class Enemy: Entity {
    
    //Identifiables
    var identifier: String {
        return UUID().uuidString
    }
    
    //Enemy Maximum Stats
    @Published var maxHP: Int
    @Published var maxDP: Int
    
    //Enemy Current Stats
    @Published var currentHP: Int
    @Published var currentDP: Int
    
    //Enemy Actions
    @Published var activeActions: [EntityAction] = []
    
    init (
        _ startingHP: Int,
        _ startingDP: Int
    ) {
        self.maxHP = startingHP
        self.maxDP = startingDP
        
        self.currentHP = startingHP
        self.currentDP = startingDP
    }
    
    func updateCurrentHP(deltaHP: Int, isHealing: Bool) {
        if isHealing {
            currentHP += deltaHP
        } else {
            let composition = deltaHP - currentDP
            currentHP -= composition
        }
    }
    
    func updateCurrentDP(deltaDP: Int) {
        //
    }
    
}

extension Enemy: Identifiable, Hashable {
    static func == (lhs: Enemy, rhs: Enemy) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}
