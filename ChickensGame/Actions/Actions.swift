//
//  newActions.swift
//  POC_Game
//
//  Created by Caio Soares on 27/03/23.
//

import Foundation

protocol Action: ObservableObject {}

// MARK -- Entity

class EntityAction: Action {
    
    //Hashable stuff
    var identifier: String {
        return UUID().uuidString
    }
    
    //Flags for processing actions
    let isHealing: Bool
    
    //Value and accuracy of said action
    var value: Int
    var cooldown: Int
    var accuracy: Double
    
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

// MARK -- Enviromental Action

class EnviromentalAction: Action {
    
    //Hashable stuff
    var identifier: String {
        return UUID().uuidString
    }
    
    //Contextual information about the Action
    let internalID: Int
    let internalName: String
    let contextualName: String
    
    init(internalID: Int, internalName: String, contextualName: String) {
        self.internalID = internalID
        self.internalName = internalName
        self.contextualName = contextualName
    }
    
}

extension EnviromentalAction: Identifiable, Hashable {
    static func == (lhs: EnviromentalAction, rhs: EnviromentalAction) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}
