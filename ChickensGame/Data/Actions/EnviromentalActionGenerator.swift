//
//  EnviromentalActionGenerator.swift
//  ChickensGame
//
//  Created by Caio Soares on 11/04/23.
//

import Foundation

class EnviromentalActionGenerator {
	func generateFullHeal() -> EnviromentalAction {
		return EnviromentalAction(internalID: 0001, internalName: "maxheal",
								  contextualName: "Golden Corn", typeOfAction: .enviromental_targetingPlayerStat,
								  value: 999, targetStat: "currentHP", targetAction: nil, internalActionName: nil)
	}
	func generateUpgradeToBasicAttack() -> EnviromentalAction {
		return EnviromentalAction(internalID: 0002, internalName: "basicAttackUpgrade",
								  contextualName: "Shaper Claws", typeOfAction: .enviromental_targetingPlayerAction,
								  value: 2, targetStat: nil, targetAction: "player_basicAttack_0001", internalActionName: nil)
	}
}
