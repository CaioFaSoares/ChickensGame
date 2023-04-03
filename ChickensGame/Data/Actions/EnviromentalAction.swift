//
//  EnviromentalAction.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import Foundation

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
