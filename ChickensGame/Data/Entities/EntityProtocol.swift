//
//  EntityProtocol.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import Foundation

protocol Entity: ObservableObject {
    
    //Entity states
    var isAlive: Bool { get set }
    
    //Entity Maximum Stats
    var maxHP: Int { get set }
    var maxDP: Int { get set }
    
    //Entity Current Stats
    var currentHP: Int { get set }
    var currentDP: Int { get set }
    
    //Entity Actions array
    var activeActions: [EntityAction] { get set }
    
    //Update internal stat funcs
    func updateCurrentHP(deltaHP: Int, isHealing: Bool)
	func updateMaxHP(deltaMaxHP: Int)
    func updateCurrentDP(deltaDP: Int, isBuffing: Bool)
    
}

extension Entity {
    
    func updateCurrentHP(deltaHP: Int, isHealing: Bool) {
        if isHealing {
            currentHP += deltaHP
			if currentHP > maxHP {
				currentHP = maxHP
			}
        } else {
            let composition = deltaHP - currentDP
            currentHP -= composition
            if currentHP < 0 {
                currentHP = 0
                isAlive = false
            }
        }
    }
	
	func updateMaxHP(deltaMaxHP: Int) {
		maxHP += deltaMaxHP
	}
    
    func updateCurrentDP(deltaDP: Int, isBuffing: Bool) {
        if isBuffing {
            currentDP += deltaDP
        } else {
            currentDP -= deltaDP
            if currentDP < 0 {
                currentDP = 0
            }
        }
    }
    
}
