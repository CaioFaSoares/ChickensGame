//
//  PlayerActions.swift
//  POC_Game
//
//  Created by Caio Soares on 28/03/23.
//

import Foundation

class PlayerAttackGenerator {
    func generateBasicAttack() -> EntityAction {
        return EntityAction(isHealing: false,
							value: 3, cooldown: 0, accuracy: 0.9,
                            internalID: 0001, internalName: "player_basicAttack_0001",
							contextualName: "Basic \nAttack!", typeOfAction: .entity_targetingAnotherEntity)
    }
    
    func generateStrongAttack() -> EntityAction {
        return EntityAction(isHealing: false,
							value: 6, cooldown: 1, accuracy: 0.7,
                            internalID: 0002, internalName: "player_strongAttack_0002",
                            contextualName: "Strong \nAttack!", typeOfAction: .entity_targetingAnotherEntity)
    }
    func generateSkillHealing() -> EntityAction {
        return EntityAction(isHealing: true,
                            value: 5, cooldown: 4, accuracy: 1,
                            internalID: 0003, internalName: "player_heal_0003",
                            contextualName: "Healing \nCorn", typeOfAction: .entity_targetingItself)
    }
	
	func generateDebugAttack() -> EntityAction {
		return EntityAction(isHealing: false,
							value: 999, cooldown: 0, accuracy: 1,
							internalID: 9999, internalName: "godslap",
							contextualName: "godslap", typeOfAction: .entity_targetingAnotherEntity)
	}
}
