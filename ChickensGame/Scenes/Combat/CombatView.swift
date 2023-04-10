//
//  ContentView.swift
//  ChickensGame
//
//  Created by Caio Soares on 28/03/23.
//

import SwiftUI
import SpriteKit

struct CombatView: View {
    
	init (player: (Int, Int), enemy: (Int, Int), delegate: any View) {
        self.gameCoordinator = GameCoordinator(player: player, enemy: enemy)
		self.gameScene = CombatScene(size: CGSize(width: UIScreen.main.bounds.width,
												  height: UIScreen.main.bounds.height / 2))
		self.gameScene.spawnEntities()
    }
    
	@ObservedObject var gameScene: CombatScene
    @ObservedObject var gameCoordinator: GameCoordinator

    var body: some View {
        VStack{
			ZStack {
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
            SpriteView(scene: gameScene)
				.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                .ignoresSafeArea()
			ZStack{
				VStack{
					Spacer()
					HStack {
						Spacer()
						ForEach(gameCoordinator.player.activeActions, id: \.self) { action in
							Button(action.contextualName) {
								casterEntityActingUponTargetEntity(action: action, caster: gameCoordinator.player, target: gameCoordinator.enemy, gMan: gameCoordinator)
							}
							Spacer()
						}
					}
					Spacer()
				}
				.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
				.ignoresSafeArea()
			}
        }
		.navigationBarBackButtonHidden(true)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//		CombatView(player: (12,2), enemy: (8,2))
//    }
//}
