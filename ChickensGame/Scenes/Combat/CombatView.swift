//
//  ContentView.swift
//  ChickensGame
//
//  Created by Caio Soares on 28/03/23.
//

import SwiftUI
import SpriteKit

struct CombatView: View {
    
    init (player: (Int, Int), enemy: (Int, Int)) {
        self.gameManager = GameManager(player: player, enemy: enemy)
		self.gameScene = CombatScene(
			size: CGSize(width: 300, height: 400)
		)
		self.gameScene.spawnPlayerEntitySprite()
		self.gameScene.spawnEnemyEntitySprite()
    }
    
	@ObservedObject var gameScene: CombatScene
    @ObservedObject var gameManager: GameManager

    var body: some View {
        VStack{
			Text("\(gameManager.combatManager.currentTurn)")
            SpriteView(scene: gameScene)
                .frame(width: 300, height: 400)
                .ignoresSafeArea()
            HStack {
                Spacer()
				Text("Player HP: \(gameManager.player.currentHP)")
                Spacer()
				Text("Enemy HP: \(gameManager.enemy.currentHP)")
                Spacer()
            }
            HStack {
                Spacer()
				ForEach(gameManager.player.activeActions, id: \.self) { action in
                    Button(action.contextualName) {
						casterEntityActingUponTargetEntity(action: action, caster: gameManager.player, target: gameManager.enemy, gMan: gameManager)
						gameScene.changeColorWhenAttacking()
                    }
                    Spacer()
                }
            }
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
