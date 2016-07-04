//
//  BoundlessMatrixTests.swift
//  BnCWater
//
//  Created by Christopher Baker on 6/29/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation
import XCTest

@testable import BnCWater

class BoundlessMatrixTests: XCTestCase {

    let protagonist: BoundlessMatrix = BoundlessMatrix.factory([
                                    [1, 5, 4, 3, 2, 1],
                                    [2, 1, 5, 4, 3, 2],
                                    [3, 2, 1, 5, 4, 3],
                                    [4, 3, 2, 1, 5, 4],
                                    [5, 4, 3, 2, 1, 5]])

    func testRetrieveCellValue() {
        XCTAssertEqual(protagonist.retrieveCell(Cartesian(x: 5, y: 1)), Cell(column: 5, row: 1, value: 2))
        XCTAssertEqual(protagonist.retrieveCell(Cartesian(x: 4, y: 2)), Cell(column: 4, row: 2, value: 4))
    }

    func testColumnsCount() {
        XCTAssertEqual(protagonist.columnsCount(), 6)
    }

    func testRowsCount() {
        XCTAssertEqual(protagonist.rowsCount(), 5)
    }

    func testIsFinalColumm() {
        XCTAssertTrue(protagonist.isFinalColumn(Cartesian(x: 6, y: 1)))
        XCTAssertFalse(protagonist.isFinalColumn(Cartesian(x: 5, y: 1)))
    }

    func testLeftOfCellMotion() {
        XCTAssertEqual(protagonist.leftOfCell(Cartesian(x: 2, y: 1)).toCartesian(), Cartesian(x: 3, y: 5),
                "Last row should wrap to the first.")

        XCTAssertEqual(protagonist.leftOfCell(Cartesian(x: 2, y: 2)).toCartesian(), Cartesian(x: 3, y: 1),
                "Should be one over and one up.")
    }

    func testCenterOfCellMotion() {
        XCTAssertEqual(protagonist.centerOfCell(Cartesian(x: 2, y: 1)).toCartesian(), Cartesian(x: 3, y: 1),
                "Should be one over.")
    }

    func testRightOfCellMotion() {
        XCTAssertEqual(protagonist.rightOfCell(Cartesian(x: 2, y: 5)).toCartesian(), Cartesian(x: 3, y: 1),
                "First row should wrap to the last.")

        XCTAssertEqual(protagonist.rightOfCell(Cartesian(x: 2, y: 2)).toCartesian(), Cartesian(x: 3, y: 3),
                "Should be one over and one down.")
    }
}