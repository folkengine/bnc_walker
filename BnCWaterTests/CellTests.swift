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
        XCTAssertTrue(Cell(column: 5, row: 4, value: 9) == Cell(column: 5, row: 4, value: 9))
        XCTAssertFalse(Cell(column: 5, row: 4, value: 9) == Cell(column: 5, row: 4, value: 3))
    }

    func testToCartesian() {
        XCTAssertEqual(Cell(column: 5, row: 4, value: 9).toCartesian(), Cartesian(x: 5, y: 4))
    }

    func testMostPassive() {
        let strong = Cell(column: 5, row: 4, value: 9)
        let middlin = Cell(column: 5, row: 4, value: 3)
        let weak = Cell(column: 5, row: 4, value: 1)
        XCTAssertEqual(Cell.mostPassive(cells: [strong, weak, middlin]), weak)
    }
    
    func testSumOfValues() {
        let strong = Cell(column: 5, row: 4, value: 9)
        let middlin = Cell(column: 5, row: 4, value: 3)
        let weak = Cell(column: 5, row: 4, value: 1)
        XCTAssertEqual(Cell.sumOfValues(cells: [strong, weak, middlin]), 13)
        XCTAssertEqual(Cell.sumOfValues(cells: [strong, weak, middlin, weak]), 14)
    }

    func testHashValue() {
        XCTAssertEqual(Cell(column: 5, row: 4, value: 9).hashValue, Cell(column: 5, row: 4, value: 9).hashValue)
        XCTAssertNotEqual(Cell(column: 5, row: 4, value: 9).hashValue, Cell(column: 4, row: 5, value: 9).hashValue)
    }
}
