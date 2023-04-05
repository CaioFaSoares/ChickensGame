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
	
	let playerXSP = UIScreen.main.bounds.width / 6
	let playerYSP = UIScreen.main.bounds.width / 6
	
	override func didMove(to view: SKView) {
		physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
	}
	
	func spawnPlayerEntitySpriteWithTexture() {
		let player = SKSpriteNode(imageNamed: "Player")
		player.scale(to: defaultScale)
		player.position = CGPoint(x: playerXSP,
								  y: playerYSP)
		player.name = "player"
		addChild(player)
	}
	
	func spawnEnemyEntitySpriteWithTexture() {
		let enemy = SKSpriteNode(imageNamed: "Enemy")
		enemy.scale(to: defaultScale)
		enemy.position = CGPoint(x: UIScreen.main.bounds.width - playerXSP,
								 y: playerYSP)
		enemy.name = "enemy"
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
