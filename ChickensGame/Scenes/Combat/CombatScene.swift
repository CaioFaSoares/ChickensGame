//
//  CombatScene.swift
//  ChickensGame
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SpriteKit

class CombatScene: SKScene, ObservableObject {
	
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
		let colorChange = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
		colorChange.name = "colorizer"
		childNode(withName: "friendly")?.addChild(colorChange)
	}
	
}
