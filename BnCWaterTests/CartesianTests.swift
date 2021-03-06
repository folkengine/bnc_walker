//
// Created by Christopher Baker on 7/1/16.
// Copyright (c) 2016 Christopher Baker. All rights reserved.
//

import Foundation
import XCTest

@testable import BnCWater

class CartesianTests: XCTestCase {

    func testCartesianEquality() {
        XCTAssertTrue(Cartesian(x: 5, y: 4) == Cartesian(x: 5, y: 4))
        XCTAssertFalse(Cartesian(x: 5, y: 4) == Cartesian(x: 5, y: 3))
    }

    func testToCell() {
        XCTAssertEqual(Cartesian(x: 2, y: 1).toCell(value: 3), Cell(column: 2, row: 1, value: 3))
    }

    func testHashValue() {
        XCTAssertEqual(Cartesian(x: 2, y: 1).hashValue, Cartesian(x: 2, y: 1).hashValue)
        XCTAssertNotEqual(Cartesian(x: 1, y: 2).hashValue, Cartesian(x: 2, y: 1).hashValue)
    }
}
