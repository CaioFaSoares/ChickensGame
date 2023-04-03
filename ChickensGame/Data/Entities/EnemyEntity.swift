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
    
    var isAlive = Bool(true)
    
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
    
}

extension Enemy: Identifiable, Hashable {
    static func == (lhs: Enemy, rhs: Enemy) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}

extension Enemy {
	func generateAttacks() {
		self.activeActions.append(EnemyAttackGenerator().generateBasicAttack())
		self.activeActions.append(EnemyAttackGenerator().generateStrongAttack())
	}
}
