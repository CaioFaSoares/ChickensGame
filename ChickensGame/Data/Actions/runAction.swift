//
//  Strings.swift
//  POC_Game
//
//  Created by Caio Soares on 23/03/23.
//

import Foundation

func processButtonPress(
	action  inputAction: any Action,
	caster  casterEntity: any Entity,
	target  targetEntity: any Entity,
	gMan	gameCoordinator: GameCoordinator
) -> Void {
	switch inputAction.typeOfAction {
		case .targetsAnotherEntity:
		casterEntityActingUponTargetEntity(action: inputAction as! EntityAction, caster: casterEntity, target: targetEntity, gMan: gameCoordinator)
		case .targetsOwnCaster:
		entityActingUponItself(action: inputAction as! EntityAction, caster: casterEntity, gMan: gameCoordinator)
	}
}

func casterEntityActingUponTargetEntity(
    action  inputAction: EntityAction,
    caster  casterEntity: any Entity,
    target  targetEntity: any Entity,
	gMan	gameCoordinator: GameCoordinator
) -> Void {
    
    let hitChance = Double.random(in: 0...1)
    
    if hitChance < inputAction.accuracy {
		gameCoordinator.newestLog = "\(type(of: casterEntity)) has hit \(type(of: targetEntity)) for \(inputAction.value)!"
        targetEntity.updateCurrentHP(deltaHP: inputAction.value, isHealing: inputAction.isHealing)
        print("He has \(targetEntity.currentHP)")
    } else {
		gameCoordinator.newestLog = "\(type(of: casterEntity)) missed his \(inputAction.contextualName)!"
    }
	
	inputAction.processActionInternalCooldown()
	gameCoordinator.endTurn()
	
}

func entityActingUponItself(
	action  inputAction: EntityAction,
	caster  casterEntity: any Entity,
	gMan 	gameCoordinator: GameCoordinator
) -> Void {
	
	let hitChance = Double.random(in: 0...1)
	if hitChance < inputAction.accuracy {
		gameCoordinator.newestLog = "\(type(of: casterEntity)) casted \(inputAction.contextualName)!"
		casterEntity.updateCurrentHP(deltaHP: inputAction.value, isHealing: inputAction.isHealing)
	} else {
		gameCoordinator.newestLog = "\(type(of: casterEntity)) casted \(inputAction.contextualName) but missed!!"
	}
	
	inputAction.processActionInternalCooldown()
	gameCoordinator.endTurn()
	
}

func enviromentalActionUponPlayer(
    action  inputAction: EnviromentalAction,
    player  playerEntity: Player
) -> Any {
    
    return " "
    
}



