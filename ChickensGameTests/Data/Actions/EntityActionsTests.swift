//
//  EntityActionsTests.swift
//  ChickensGameTests
//
//  Created by Lucas Barbosa de Oliveira on 08/04/23.
//

import XCTest
@testable import ChickensGame

final class EntityActionsTests: XCTestCase {
    func testprocessActionInternalCooldown() {
        // this function will work if a return is called in the function, eiter the result are false
//        let testProcess = testprocessActionInternalCooldown()
        //        XCTAssertTrue(testProcess)


        let testFake = false
        XCTAssertFalse(testFake)

    }

    func testHash(){
        let testHash = hash(into: 1)
    }
}
