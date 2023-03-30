//
//  EntityProtocol.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import Foundation

protocol Entity: ObservableObject {
    
    //Player Maximum Stats
    var maxHP: Int { get set }
    var maxDP: Int { get set }
    
    //Player Current Stats
    var currentHP: Int { get set }
    var currentDP: Int { get set }
    
    //Actions array
    var activeActions: [EntityAction] { get set }
    
    //Update internal stat funcs
    func updateCurrentHP(deltaHP: Int, isHealing: Bool)
    func updateCurrentDP(deltaDP: Int)
    
}
