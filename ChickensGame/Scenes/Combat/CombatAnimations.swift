//
//  CombatAnimations.swift
//  ChickensGame
//
//  Created by Lucas Barbosa de Oliveira on 12/04/23.
//

import Foundation
import SpriteKit

protocol combatAnimations {
    func basicAttackAnimation(imageName: String) -> SKSpriteNode
    func cornHealingAnimation(imageName: String) -> SKScene
    func strongAttackAnimation(imageName: String) -> SKSpriteNode 
}

extension CombatScene: combatAnimations {
    func basicAttackAnimation(imageName: String) -> SKSpriteNode {
        // Criar o nó do objeto a ser animado
        let objectNode = SKSpriteNode(imageNamed: imageName)
        objectNode.position = CGPoint(x: frame.midX, y: frame.midY)

        // Definir os pontos inicial e final da animação
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

    func cornHealingAnimation(imageName: String) -> SKScene {
        let sceneSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let scene = SKScene(size: sceneSize)
        let imageNode = SKSpriteNode(imageNamed: imageName)
        imageNode.size = CGSize(width: 100, height: 100)
        imageNode.position = CGPoint(x: -UIScreen.main.bounds.width / 2 + 50, y: -UIScreen.main.bounds.height / 2 + 50)
        let path = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2),
                                radius: UIScreen.main.bounds.width / 2 - 50,
                                startAngle: .pi,
                                endAngle: 2 * .pi,
                                clockwise: true)
        let followPath = SKAction.follow(path.cgPath, asOffset: false, orientToPath: false, speed: 200)

        let removeAction = SKAction.removeFromParent()

        let sequenceAction = SKAction.sequence([followPath, removeAction])

        imageNode.run(sequenceAction)
        scene.addChild(imageNode)
        return scene
    }

    func strongAttackAnimation(imageName: String) -> SKSpriteNode {
        let objectNode = SKSpriteNode(imageNamed: imageName)
        objectNode.position = CGPoint(x: UIScreen.main.bounds.width / 4, y:UIScreen.main.bounds.width / 4 )

        // Definir os pontos inicial e final da animação
        let endPoint = CGPoint(x: frame.maxX, y: UIScreen.main.bounds.width / 4)

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


}








