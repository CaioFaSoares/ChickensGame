//
//  ContentView.swift
//  ChickensGame
//
//  Created by Caio Soares on 28/03/23.
//

import SwiftUI
import SpriteKit

struct CombatView: View {
    
	init (coordinator: GameCoordinator) {
        self.gameCoordinator = coordinator
		self.gameScene = CombatScene(size: CGSize(width: UIScreen.main.bounds.width,
												  height: UIScreen.main.bounds.height / 2))
		self.gameScene.spawnEntities()
    }
	
	@ObservedObject var gameScene: CombatScene
    @ObservedObject var gameCoordinator: GameCoordinator
	
	@State var isShowingUpgrades: Bool
    
	var body: some View {
        VStack{
			ZStack {
				CombatStatTracker(gameCoordinator: gameCoordinator)
			}
			ZStack {
				
				CombatSceneView(gameCoordinator: gameCoordinator, gameScene: gameScene)
			}
			ZStack{
				CombatActionView(gameCoordinator: gameCoordinator)
			}
        }
		.navigationBarBackButtonHidden(true)
    }
}

struct CombatStatTracker: View {
	
	@ObservedObject var gameCoordinator: GameCoordinator
	
	var body: some View {
		Spacer()
		VStack{
			Spacer()
			Text("\(gameCoordinator.combatManager.currentTurn)")
			Spacer()
			HStack {
				Spacer()
				Text("Player HP: \(gameCoordinator.player.currentHP)")
				Spacer()
				Text("Enemy HP: \(gameCoordinator.enemy.currentHP)")
				Spacer()
			}
			Spacer()
		}
		Spacer()
		.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
		.ignoresSafeArea()
	}
}

struct CombatSceneView: View {
	
	@ObservedObject var gameCoordinator: GameCoordinator
	@ObservedObject var gameScene: CombatScene
	
	var body: some View {
		SpriteView(scene: gameScene)
			.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
			.ignoresSafeArea()
		VStack {
			Text("\(gameCoordinator.newestLog)")
				.padding(.all)
			Spacer()
		}
	}
	
}

struct CombatActionView: View {
	
	@ObservedObject var gameCoordinator: GameCoordinator
	
	var body: some View {
		VStack{
			Spacer()
			HStack {
				Spacer()
				ForEach(gameCoordinator.player.activeActions, id: \.self) { action in
					Button(action.contextualName) {
						processButtonPress(action: action, caster: gameCoordinator.player, target: gameCoordinator.enemy, gMan: gameCoordinator)
					}.buttonStyle(ActionButton())
					Spacer()
				}
			}
			Spacer()
		}
		.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
		.ignoresSafeArea()
	}
}


