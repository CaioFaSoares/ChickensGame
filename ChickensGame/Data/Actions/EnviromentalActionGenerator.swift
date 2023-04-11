//
//  EnviromentalActionGenerator.swift
//  ChickensGame
//
//  Created by Caio Soares on 11/04/23.
//

import Foundation

class EnviromentalActionGenerator {
	func generateBasicAttack() -> EnviromentalAction {
		return EnviromentalAction(internalID: 0001, internalName: "maxheal",
								  contextualName: "Golden Corn", typeOfAction: .enviromental_targetingPlayerStat,
								  value: Int.max, statName: "currentHP",internalActionName: nil)
	}
}
