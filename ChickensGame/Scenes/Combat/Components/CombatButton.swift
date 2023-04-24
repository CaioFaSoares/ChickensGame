import Foundation
import SwiftUI

struct CombatButton: View {
	
	@ObservedObject var gameCoordinator: GameCoordinator
	var action: EntityAction
	
	var body: some View {
		if action.isOffCooldown {
			Button(action.contextualName){
				processButtonPress(action: action, caster: gameCoordinator.player, target: gameCoordinator.enemy, gMan: gameCoordinator)
			}.buttonStyle(ActionButton())
		} else {
			Button(action.contextualName){}.buttonStyle(ActionButtonInactive())
		}
		Spacer()
	}
	
}
