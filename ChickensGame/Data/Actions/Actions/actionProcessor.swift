//
//  Processor.swift
//  ChickensGame
//
//  Created by Caio Soares on 11/04/23.
//

import Foundation

func processButtonPress(
	action  inputAction: any Action,
	caster  casterEntity: (any Entity)?,
	target  targetEntity: (any Entity)?,
	gMan	gameCoordinator: GameCoordinator
) -> Void {
	guard let isInputActionEntityAction = inputAction as? EntityAction else { return }
	if !isInputActionEntityAction.isOffCooldown {
		print("you shouldn't be able to cast \(isInputActionEntityAction.internalName). \(casterEntity.currentHP) \(targetEntity.currentHP)")
	}
	
	gameCoordinator.newestLog = ""
	
	switch inputAction.typeOfAction {
		case .entity_targetingAnotherEntity:
			casterEntityActingUponTargetEntity(action: inputAction as! EntityAction,
											   caster: casterEntity, target: targetEntity, gMan: gameCoordinator)
		case .entity_targetingItself:
			entityActingUponItself(action: inputAction as! EntityAction,
								   caster: casterEntity, gMan: gameCoordinator)
		case .enviromental_targetingPlayerStat:
			enviromentalActionUponPlayer(action: inputAction as! EnviromentalAction,
										 player: casterEntity as! Player, gMan: gameCoordinator)
		case .enviromental_targetingPlayerAction:
			enviromentalActionUponPlayerAction(action: inputAction as! EnviromentalAction,
											   player: casterEntity as! Player, gMan: gameCoordinator)
		
	}
}

func gameLogger(string: String, gman: GameCoordinator) {
	gman.newestLog = "\(gman.newestLog)\n\(string)"
}
