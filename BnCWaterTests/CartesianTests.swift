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
        XCTAssertEqual(Cartesian(x: 2, y: 1).toCell(3), Cell(row: 2, column: 1, value: 3))
    }

}
