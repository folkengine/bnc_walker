//
// Created by Christopher Baker on 7/1/16.
// Copyright (c) 2016 Christopher Baker. All rights reserved.
//

import Foundation
import XCTest

@testable import BnCWater

class CartesianTests: XCTestCase {

    func testCartesianEquality() {
        XCTAssertTrue(Cartesian(y: 4, x: 5) == Cartesian(y: 4, x: 5))
        XCTAssertFalse(Cartesian(y: 4, x: 5) == Cartesian(y: 3, x: 5))
    }

    func testToCell() {
        XCTAssertEqual(Cartesian(y: 1, x: 2).toCell(3), Cell(row: 2, column: 1, value: 3))
    }

}
