//
//  Strings.swift
//  POC_Game
//
//  Created by Caio Soares on 23/03/23.
//

import Foundation

func casterEntityActingUponTargetEntity(
    action  inputAction: EntityAction,
    caster  casterEntity: (any Entity)?,
    target  targetEntity: any Entity,
	gMan	gameCoordinator: GameCoordinator
	
) -> Void {
    
    let hitChance = Double.random(in: 0...1)
    
    if hitChance < inputAction.accuracy {
        print("You've hit!")
        targetEntity.updateCurrentHP(deltaHP: inputAction.value, isHealing: inputAction.isHealing)
        print("He has \(targetEntity.currentHP)")
    } else {
        print("You've missed!")
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

func entityActingUponItself(
    action  inputAction: EntityAction,
    caster  casterEntity: any Entity
) -> Any {
    
    return " "
    
}

