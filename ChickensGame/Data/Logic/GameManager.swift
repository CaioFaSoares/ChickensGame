//
//  GameManager.swift
//  ChickensGame
//
//  Created by Caio Soares on 31/03/23.
//

import Foundation
import Combine

class GameManager: ObservableObject {
    
    //Entities initialization
    @Published var player: Player
    @Published var enemy: Enemy
	
	var anyCancellable: AnyCancellable? = nil
    
    init(player: (Int, Int), enemy: (Int, Int)) {
        self.player = Player(player.0, player.1)
        self.enemy = Enemy(enemy.0, enemy.1)
		
		let atk1 = PlayerAttackGenerator().generateBasicAttack()
		let atk2 = PlayerAttackGenerator().generateStrongAttack()
		
		self.player.activeActions.append(atk1)
		self.player.activeActions.append(atk2)
		
		anyCancellable = self.player.objectWillChange.sink { [weak self] (_) in self?.objectWillChange.send() }
			
		anyCancellable = self.enemy.objectWillChange.sink { [weak self] (_) in self?.objectWillChange.send() }

		
		print("Game manager has been initialized")
    }
    
}
