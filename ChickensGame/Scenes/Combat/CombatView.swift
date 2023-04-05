//
//  ContentView.swift
//  ChickensGame
//
//  Created by Caio Soares on 28/03/23.
//

import SwiftUI
import SpriteKit

protocol combatDelegate {
	func returnAfterFightIsComplete()
}

struct CombatView: View {
    
	init (player: (Int, Int), enemy: (Int, Int), delegate: combatDelegate) {
        self.gameManager = GameManager(player: player, enemy: enemy)
		self.gameScene = CombatScene(size: CGSize(width: UIScreen.main.bounds.width,
												  height: UIScreen.main.bounds.height / 2))
		self.gameScene.spawnEntities()
		self.delegate = delegate
    }
	
	var delegate: combatDelegate
    
	@ObservedObject var gameScene: CombatScene
    @ObservedObject var gameManager: GameManager

    var body: some View {
        VStack{
			ZStack {
				Spacer()
				VStack{
					Spacer()
					Text("\(gameManager.combatManager.currentTurn)")
					Spacer()
					HStack {
						Spacer()
						Text("Player HP: \(gameManager.player.currentHP)")
						Spacer()
						Text("Enemy HP: \(gameManager.enemy.currentHP)")
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
						ForEach(gameManager.player.activeActions, id: \.self) { action in
							Button(action.contextualName) {
								casterEntityActingUponTargetEntity(action: action, caster: gameManager.player, target: gameManager.enemy, gMan: gameManager)
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

extension CombatView {
	func returnAfterFightIsComplete() {
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView(player: (12,2), enemy: (8,2))
    }
}
