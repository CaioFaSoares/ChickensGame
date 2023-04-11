//
//  casterVcaster.swift
//  ChickensGame
//
//  Created by Caio Soares on 11/04/23.
//

import Foundation

func entityActingUponItself(
	action  inputAction: EntityAction,
	caster  casterEntity: any Entity,
	gMan 	gameCoordinator: GameCoordinator
) -> Void {
	
	let hitChance = Double.random(in: 0...1)
	if hitChance < inputAction.accuracy {
		gameLogger(string: "\(type(of: casterEntity)) casted \(inputAction.contextualName)!", gman: gameCoordinator)
		casterEntity.updateCurrentHP(deltaHP: inputAction.value, isHealing: inputAction.isHealing)
	} else {
		gameCoordinator.newestLog = "\(type(of: casterEntity)) casted \(inputAction.contextualName) but missed!!"
	}
	
	inputAction.actionsHasBeenCasted()
	gameCoordinator.endTurn()
	
}
