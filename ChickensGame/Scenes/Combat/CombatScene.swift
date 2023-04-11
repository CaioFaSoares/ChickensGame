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

    func basicAttackAnimation(imageName: String) -> SKSpriteNode {
        // Criar o nó do objeto a ser animado
        let objectNode = SKSpriteNode(imageNamed: imageName)
        objectNode.position = CGPoint(x: frame.midX, y: frame.midY)

        // Definir os pontos inicial e final da animação
        let startPoint = objectNode.position
        let endPoint = CGPoint(x: frame.maxX, y: frame.minY)

        // Criar a ação de mover o objeto
        let moveAction = SKAction.move(to: endPoint, duration: 2.0)
        moveAction.timingMode = .easeInEaseOut

        //remove o parente
        let removeAction = SKAction.removeFromParent()

        //cria a sequencia de acoes no caso bater e apagar
        let sequenceAction = SKAction.sequence([moveAction, removeAction])

        // Executar a ação de sequência de ações no nó do objeto
        objectNode.run(sequenceAction)


        return objectNode
    }


//    func cornHealingAnimation(imageName: String) -> SKScene {
//        let sceneSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        let scene = SKScene(size: sceneSize)
//        let imageNode = SKSpriteNode(imageNamed: imageName)
//        imageNode.size = CGSize(width: 100, height: 100)
//        imageNode.position = CGPoint(x: -UIScreen.main.bounds.width / 2 + 50, y: -UIScreen.main.bounds.height / 2 + 50)
//        let path = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2),
//                                radius: UIScreen.main.bounds.width / 2 - 50,
//                                startAngle: .pi,
//                                endAngle: 2 * .pi,
//                                clockwise: true)
//        let followPath = SKAction.follow(path.cgPath, asOffset: false, orientToPath: false, speed: 100)
//        let rotate = SKAction.rotate(byAngle: -.pi / 2, duration: 0.0)
//        let group = SKAction.group([followPath, rotate])
//        let repeatForever = SKAction.repeatForever(group)
//        imageNode.run(repeatForever)
//        scene.addChild(imageNode)
//        return scene
//    }









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

        addChild(test)

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
