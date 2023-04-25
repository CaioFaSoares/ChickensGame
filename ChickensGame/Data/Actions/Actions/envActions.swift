//
//  envActions.swift
//  ChickensGame
//
//  Created by Caio Soares on 11/04/23.
//

import Foundation

func enviromentalActionUponPlayer(
	action  inputAction: EnviromentalAction,
	player  playerEntity: Player,
	gMan 	gameCoordinator: GameCoordinator
) -> Void {
	
    switch inputAction.targetStat {
    case "currentHP":
        playerEntity.updateCurrentHP(deltaHP: inputAction.value, isHealing: true)
    default:
        print("")
    }
    gameCoordinator.upgradeWasChosen()
	
}

func enviromentalActionUponPlayerAction(
	action  inputAction: EnviromentalAction,
	player  playerEntity: Player,
	gMan 	gameCoordinator: GameCoordinator
) -> Void {
	
	// find action with that name
    for action in playerEntity.activeActions where action.internalName == inputAction.targetAction {
        print("\(action.contextualName) -> \(action.value)")
        action.value += inputAction.value
        print("\(action.contextualName) -> \(action.value)")
    }
    gameCoordinator.upgradeWasChosen()
	
}


