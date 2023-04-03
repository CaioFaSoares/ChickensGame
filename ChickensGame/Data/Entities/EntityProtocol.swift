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
    func updateCurrentDP(deltaDP: Int, isBuffing: Bool)
    
    //Action processing
    func identifyAction(action: any Action)
    func processAction(action: any Action)
    
}

extension Entity {
    
    func identifyAction(action: any Action) {
        //
    }
    
    func processAction(action: any Action) {
        //
    }
    
    func updateCurrentHP(deltaHP: Int, isHealing: Bool) {
        if isHealing {
            currentHP += deltaHP
        } else {
            let composition = deltaHP - currentDP
            currentHP -= composition
            if currentHP < 0 {
                currentHP = 0
                isAlive = false
                print("dead")
            }
        }
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
