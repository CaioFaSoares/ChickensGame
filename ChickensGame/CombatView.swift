//
//  ContentView.swift
//  ChickensGame
//
//  Created by Caio Soares on 28/03/23.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene, ObservableObject {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    func spawnPlayerEntitySprite() {
        let friendly = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
        friendly.position = CGPoint(x: 50, y: 25)
		friendly.name = "friendly"
        addChild(friendly)
    }
    
    func spawnEnemyEntitySprite() {
        let enemy = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        enemy.position = CGPoint(x: 250, y: 25)
        addChild(enemy)
    }
	
	func changeColorWhenAttacking() {
		var colorChange = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
		colorChange.name = "colorizer"
		childNode(withName: "friendly")?.addChild(colorChange)
		childNode(withName: "friendly")?.removeAllChildren()
	}
    
}

struct CombatView: View {
    
    init (player: (Int, Int), enemy: (Int, Int)) {
        self.gameManager = GameManager(player: player, enemy: enemy)
		self.gameScene = GameScene(
			size: CGSize(width: 300, height: 400)
		)
		self.gameScene.spawnPlayerEntitySprite()
		self.gameScene.spawnEnemyEntitySprite()
    }
    
	@ObservedObject var gameScene: GameScene
    @ObservedObject var gameManager: GameManager

    var body: some View {
        VStack{
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
						casterEntityActingUponTargetEntity(action: action, caster: gameManager.player, target: gameManager.enemy)
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
