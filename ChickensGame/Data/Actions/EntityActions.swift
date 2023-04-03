//
//  EntityActions.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import Foundation

class EntityAction: Action {
    
    //Hashable stuff
    var identifier: String {
        return UUID().uuidString
    }
    
    //Flags for processing actions
    let isHealing: Bool
    
    //Value and accuracy of said action
    var value: Int
    var accuracy: Double
    
    //Cooldown logic
    var cooldown: Int
    var lastCast: Int
    
    //Contextual information about the Action
    let internalID: Int
    let internalName: String
    let contextualName: String
    
    init(isHealing: Bool, value: Int, cooldown: Int, accuracy: Double, internalID: Int, internalName: String, contextualName: String) {
        self.isHealing = isHealing
        self.value = value
        self.cooldown = cooldown
        self.accuracy = accuracy
        self.internalID = internalID
        self.internalName = internalName
        self.contextualName = contextualName
        
        self.lastCast = 0
    }
}

extension EntityAction: Identifiable, Hashable {
    static func == (lhs: EntityAction, rhs: EntityAction) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}

extension EntityAction {
    func isActionOffCooldown(_ action: EntityAction, _ currentTurn: Int) -> Bool {
        if action.lastCast - currentTurn >= action.cooldown {
            return true
        } else { return false }
    }
}
