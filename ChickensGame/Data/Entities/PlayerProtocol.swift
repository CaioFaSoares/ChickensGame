//
//  PlayerProtocol.swift
//  ChickensGame
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation

protocol PlayerProtocol: Entity {
	
	var isAlive: Bool { get set }
	
	//Player Default Stats
	var startingHP: Int { get set }
	var startingDP: Int { get set }
	
}
