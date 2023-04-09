//
//  PlayerActionsGeneratorTests.swift
//  ChickensGameTests
//
//  Created by Lucas Barbosa de Oliveira on 08/04/23.
//

import XCTest
@testable import ChickensGame

final class PlayerActionsGeneratorTests: XCTestCase {
    func testGenerateExampleAttack(){
        let testEntityAction = EntityAction(isHealing: true, value: 0, cooldown: 0, accuracy: 0.0, internalID: 0000, internalName: "0", contextualName: "0")

        XCTAssertTrue(testEntityAction.isHealing)
        XCTAssertEqual(testEntityAction.value, 0)
        XCTAssertEqual(testEntityAction.cooldown, 0)
        XCTAssertEqual(testEntityAction.accuracy, 0.0)
        XCTAssertEqual(testEntityAction.internalID, 0000)
        XCTAssertEqual(testEntityAction.internalName, "0")
        XCTAssertEqual(testEntityAction.contextualName, "0")

    }

}
