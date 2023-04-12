//
//  CombatScene.swift
//  ChickensGame
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SpriteKit

class CombatScene: SKScene, ObservableObject {
	
	let defaultScale = CGSize(width: UIScreen.main.bounds.width / 6, height:  UIScreen.main.bounds.height / 6 / 2)
	
	let playerXSP = UIScreen.main.bounds.width / 4
	let playerYSP = UIScreen.main.bounds.width / 4

    let enemyXSP = UIScreen.main.bounds.width / 1.3
    let enemyYSP = UIScreen.main.bounds.width / 4
	
	override func didMove(to view: SKView) {
		physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

	}

        func createAnimation(texturePrefix: String, frameCount: Int, timePerFrame: TimeInterval) -> SKAction {
        var frames: [SKTexture] = []
        for i in 1..<frameCount {
            let textureName = "\(texturePrefix)\(i)"
            let texture = SKTexture(imageNamed: textureName)
            frames.append(texture)
        }
        return SKAction.animate(with: frames, timePerFrame: timePerFrame)
    }

	
	func spawnPlayerEntitySpriteWithTexture() {
		let player = SKSpriteNode(imageNamed: "Galinhaframe1")
        player.scale(to: defaultScale)
		player.position = CGPoint(x: playerXSP,
								  y: playerYSP)
		player.name = "player"

        let animation = createAnimation(texturePrefix: "GalinhaFrame", frameCount: 5, timePerFrame: 0.3)

        player.run(SKAction.repeatForever(animation))

        let test = basicAttackAnimation(imageName: "Attack-Button-Sprite")
        let test2 = cornHealingAnimation(imageName: "Corn-Sprite")
        let test3 = strongAttackAnimation(imageName: "Strong-Button-Sprite")

        addChild(test)
        addChild(test2)
        addChild(test3)

		addChild(player)
	}
	
	func spawnEnemyEntitySpriteWithTexture() {
		let enemy = SKSpriteNode(imageNamed: "Enemy")
        enemy.scale(to:defaultScale)
		enemy.position = CGPoint(x: enemyXSP,
								 y: enemyYSP)
		enemy.name = "enemy"

        let animation = createAnimation(texturePrefix: "AlienFrame", frameCount: 5, timePerFrame: 0.3)

        enemy.run(SKAction.repeatForever(animation))

		addChild(enemy)
	}
	
	func spawnBackgrounds() {
		let background = SKSpriteNode(imageNamed: "Floor")
		background.position = CGPoint(x: UIScreen.main.bounds.width / 2,
									  y: UIScreen.main.bounds.height / 4)
		background.scale(to: CGSize(width: UIScreen.main.bounds.width,
									height: UIScreen.main.bounds.height / 2))
		addChild(background)
	}
	
	func spawnEntities() {
		spawnBackgrounds()
		spawnEnemyEntitySpriteWithTexture()
		spawnPlayerEntitySpriteWithTexture()
	}
	
}


