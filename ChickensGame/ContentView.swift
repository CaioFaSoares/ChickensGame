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
        addChild(friendly)
    }
    
    func spawnEnemyEntitySprite() {
        let enemy = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        enemy.position = CGPoint(x: 250, y: 25)
        addChild(enemy)
    }
    
}

struct ContentView: View {
    
    @ObservedObject var gameScene = GameScene(
        size: CGSize(width: 300, height: 400)
    )
    
    @StateObject var player = Player(12, 2)
    @StateObject var enemy = Enemy(8, 1)
    
    @State var hasLogicBeenInitialized = false

    var body: some View {
        VStack{
            Button("Initialize Game Logic") {
                if hasLogicBeenInitialized == false {
                    gameScene.spawnPlayerEntitySprite()
                    gameScene.spawnEnemyEntitySprite()
                    player.activeActions.append(EntityAction(isHealing: false, value: 3, cooldown: 1, accuracy: 0.9, internalID: 0001, internalName: "basicAttack", contextualName: "Basic Attack"))
                    player.activeActions.append(EntityAction(isHealing: false, value: 6, cooldown: 2, accuracy: 0.7, internalID: 0002, internalName: "strongAttack", contextualName: "Strong Attack"))
                    print("init logic")
                    hasLogicBeenInitialized = true
                } else { print("logic has already been initd") }
            }
            SpriteView(scene: gameScene)
                .frame(width: 300, height: 400)
                .ignoresSafeArea()
            HStack {
                Spacer()
                Text("Player HP: \(player.currentHP)")
                Spacer()
                Text("Enemy HP: \(enemy.currentHP)")
                Spacer()
            }
            HStack {
                Spacer()
                ForEach(player.activeActions, id: \.self) { action in
                    Button(action.contextualName) {
                        casterEntityActingUponTargetEntity(action: action, caster: player, target: enemy)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}