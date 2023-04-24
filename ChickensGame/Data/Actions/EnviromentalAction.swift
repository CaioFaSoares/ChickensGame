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
	
	//Depending on actionCategory, some of these values may be used
	var value: Int
	var internalActionName: String?
	
	//Depending on actionCategory, it may be one of these or the other
	var targetStat: String?
	var targetAction: String?
	
    
    //Contextual information about the Action
    let internalID: Int
    let internalName: String
    let contextualName: String
	var typeOfAction: actionCategory
    
	init(internalID: Int, internalName: String, contextualName: String, typeOfAction: actionCategory, value: Int, targetStat: String?, targetAction: String?, internalActionName: String?) {
        self.internalID = internalID
        self.internalName = internalName
        self.contextualName = contextualName
		self.typeOfAction = typeOfAction
		self.value = value
		self.targetStat = targetStat
		self.targetAction = targetAction
		self.internalActionName = internalActionName
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
