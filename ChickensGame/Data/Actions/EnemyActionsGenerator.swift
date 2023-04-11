//
//  EnemyActions.swift
//  POC_Game
//
//  Created by Caio Soares on 28/03/23.
//

import Foundation

class EnemyAttackGenerator {
    func generateBasicAttack() -> EntityAction {
        return EntityAction(isHealing: false,
                            value: 3, cooldown: 0, accuracy: 0.70,
                            internalID: 0001, internalName: "enemy_basicAttack_0001",
                            contextualName: "Basic Attack!", typeOfAction: .entity_targetingAnotherEntity)
    }
    
    func generateStrongAttack() -> EntityAction {
        return EntityAction(isHealing: false,
                            value: 6, cooldown: 1, accuracy: 0.40,
                            internalID: 0002, internalName: "enemy_strongAttack_0002",
                            contextualName: "Strong Attack!", typeOfAction: .entity_targetingAnotherEntity)
    }
}
