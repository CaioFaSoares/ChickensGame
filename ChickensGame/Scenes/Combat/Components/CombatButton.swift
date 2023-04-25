import Foundation
import SwiftUI

struct CombatButton: View {
	
	@ObservedObject var gameCoordinator: GameCoordinator
	var action: EntityAction
	
	var body: some View {
        ZStack {
            if action.isOffCooldown {
                Image("button")
                Button(action.contextualName){
                    processButtonPress(action: action, caster: gameCoordinator.player, target: gameCoordinator.enemy, gMan: gameCoordinator)
                }.buttonStyle(ActionButton())
            } else {
                Image("button")
                Color(.gray)
                    .blendMode(.color)
                Button(action.contextualName){}.buttonStyle(ActionButtonInactive())
            }
        }
		Spacer()
	}
	
}
