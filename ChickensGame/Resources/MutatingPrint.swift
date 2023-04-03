//
//  MutatingPrint.swift
//  ChickensGame
//
//  Created by Lucas Barbosa de Oliveira on 03/04/23.
//

import Foundation

public func print(_ object: Any...) {
    #if DEBUG
    for item in object {
        Swift.print(item)

    }
    #endif
}

public func print(_ object: Any) {
    #if DEBUG
    Swift.print(object)
    #endif
}
