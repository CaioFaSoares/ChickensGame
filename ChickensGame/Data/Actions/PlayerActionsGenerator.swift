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
                            value: 3, cooldown: 1, accuracy: 0.90,
                            internalID: 0001, internalName: "player_basicAttack_0001",
                            contextualName: "Basic Attack!")
    }
    
    func generateStrongAttack() -> EntityAction {
        return EntityAction(isHealing: false,
                            value: 6, cooldown: 2, accuracy: 0.70,
                            internalID: 0002, internalName: "player_strongAttack_0002",
                            contextualName: "Strong Attack!")
    }
}
