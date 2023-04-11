//
//  casterEntityTargetingAnotherEntity.swift
//  ChickensGame
//
//  Created by Caio Soares on 11/04/23.
//

import Foundation

func casterEntityActingUponTargetEntity(
	action  inputAction: EntityAction,
	caster  casterEntity: any Entity,
	target  targetEntity: any Entity,
	gMan	gameCoordinator: GameCoordinator
) -> Void {
	
	let hitChance = Double.random(in: 0...1)
	
	if hitChance < inputAction.accuracy {
		gameLogger(string: "\(type(of: casterEntity)) has hit \(type(of: targetEntity)) for \(inputAction.value)!"
, gman: gameCoordinator)
		targetEntity.updateCurrentHP(deltaHP: inputAction.value, isHealing: inputAction.isHealing)
	} else {
		gameLogger(string: "\(type(of: casterEntity)) missed his \(inputAction.contextualName)!", gman: gameCoordinator)
	}
	
	inputAction.actionsHasBeenCasted()
	gameCoordinator.endTurn()
	
}
