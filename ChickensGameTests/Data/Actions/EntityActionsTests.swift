//
//  EntityActionsTests.swift
//  ChickensGameTests
//
//  Created by Lucas Barbosa de Oliveira on 08/04/23.
//

import XCTest
@testable import ChickensGame

final class EntityActionsTests: XCTestCase {
    func testProtocolPlayer(){
        let testplayer = Player(10, 10)

        XCTAssertEqual(testplayer.startingHP, 10)
        XCTAssertEqual(testplayer.startingDP, 10)

        XCTAssertEqual(testplayer.$currentScore, 0)

    }
    func testEntityProtocol(){
        class testEntity: Entity,ObservableObject {
            func updateCurrentDP(deltaDP: Int, isBuffing: Bool) {
                <#code#>
            }
        }
    }

}
