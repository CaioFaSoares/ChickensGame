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
    
	var body: some View {
        ZStack {
            VStack{
                ZStack {
                    CombatStatTracker(gameCoordinator: gameCoordinator)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                ZStack {
                    CombatSceneView(gameCoordinator: gameCoordinator, gameScene: gameScene)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                ZStack{
                    CombatActionView(gameCoordinator: gameCoordinator)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
            }.navigationBarBackButtonHidden(true)
                .blur(radius: gameCoordinator.blurVal)
            
            switch gameCoordinator.gameState {
            case .combatIsOngoing:
                EmptyView()
            case .combatHasBeenLost:
                DeadView(gameCoordinator: gameCoordinator)
            case .combatHasBeenWon:
                UpgradeView(gameCoordinator: gameCoordinator)
            }
        }
    }
}

struct DeadView: View {
    
    @ObservedObject var gameCoordinator: GameCoordinator
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.75)
                .ignoresSafeArea()
            Image("selection-screen")
            Color.gray.blendMode(.color)
            VStack{
                Text("You've died!!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.all)
                Button("Restart game!") {
                    
                }
            }
        }
    }
}

struct UpgradeView: View {
    
    @ObservedObject var gameCoordinator: GameCoordinator
    
    var body: some View {
        ZStack {
            ZStack {
                Color(.black)
                    .opacity(0.75)
                    .ignoresSafeArea()
                Image("selection-screen")
                VStack{
                    Text("You've won!")
                        .font(.title)
                        .padding(.all)
                    Group {
                        ForEach(gameCoordinator.selectableUpgrades, id: \.self) { action in
                            Button(action.contextualName) { processButtonPress(action: action, caster: gameCoordinator.player, target: nil, gMan: gameCoordinator) }
                                .padding(.all)
                                .buttonStyle(.bordered)
                        }
                    }
                }
            }
        }
    }
}

struct CombatStatTracker: View {
	
	@ObservedObject var gameCoordinator: GameCoordinator
	
	var body: some View {
		Spacer()
		VStack{
			Spacer()
            HStack{
                Text("\(gameCoordinator.combatManager.currentTurn)")
                Text("\(gameCoordinator.combatLevel)")
            }
			Spacer()
			HStack {
				Spacer()
				Text("Player HP: \(gameCoordinator.player.currentHP) / \(gameCoordinator.player.maxHP)")
				Spacer()
				Text("Enemy HP: \(gameCoordinator.enemy.currentHP) / \(gameCoordinator.enemy.maxHP)")
				Spacer()
			}
			Spacer()
		}
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
					CombatButton(gameCoordinator: gameCoordinator, action: action)
				}
			}
			Spacer()
		}
		.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
		.ignoresSafeArea()
	}
}
