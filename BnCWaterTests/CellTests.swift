//
//  CellTests.swift
//  BnCWater
//
//  Created by Christopher Baker on 7/1/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation
import XCTest

@testable import BnCWater

class CellTests: XCTestCase {
    
    func testCellEquality() {
        XCTAssertTrue(Cell(row: 4, column: 5, value: 9) == Cell(row: 4, column: 5, value: 9))
        XCTAssertFalse(Cell(row: 4, column: 5, value: 9) == Cell(row: 4, column: 5, value: 3))
    }

    func testToCartesian() {
        XCTAssertEqual(Cell(row: 4, column: 5, value: 9).toCartesian(), Cartesian(x: 4, y: 5))
    }

    func testMostPassive() {
        let strong = Cell(row: 4, column: 5, value: 9)
        let middlin = Cell(row: 4, column: 5, value: 3)
        let weak = Cell(row: 4, column: 5, value: 1)
        XCTAssertEqual(Cell.mostPassive([strong, weak, middlin]), weak)
    }
    
    func testSumOfValues() {
        let strong = Cell(row: 4, column: 5, value: 9)
        let middlin = Cell(row: 4, column: 5, value: 3)
        let weak = Cell(row: 4, column: 5, value: 1)
        XCTAssertEqual(Cell.sumOfValues([strong, weak, middlin]), 13)
        XCTAssertEqual(Cell.sumOfValues([strong, weak, middlin, weak]), 14)
    }

    func testHashValue() {
        XCTAssertEqual(Cell(row: 4, column: 5, value: 9).hashValue, Cell(row: 4, column: 5, value: 9).hashValue)
        XCTAssertNotEqual(Cell(row: 4, column: 5, value: 9).hashValue, Cell(row: 5, column: 4, value: 9).hashValue)
    }
}
