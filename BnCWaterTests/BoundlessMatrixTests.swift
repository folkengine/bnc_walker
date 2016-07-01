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

    var subject: BoundlessMatrix = BoundlessMatrix.factory([
                                    [1, 5, 4, 3, 2, 1],
                                    [2, 1, 5, 4, 3, 2],
                                    [3, 2, 1, 5, 4, 3],
                                    [4, 3, 2, 1, 5, 4],
                                    [5, 4, 3, 2, 1, 5]])

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRetrieveCellValue() {
        XCTAssertEqual(subject.retrieveCellValue(Cell(row: 1, column: 5)), 2)
        XCTAssertEqual(subject.retrieveCellValue(Cell(row: 2, column: 4)), 4)
    }

    func testColumnsCount() {
        XCTAssertEqual(subject.columnsCount(), 6)
    }

    func testRowsCount() {
        XCTAssertEqual(subject.rowsCount(), 5)
    }

    func testIsFinalColumm() {
        XCTAssertTrue(subject.isFinalColumm(Cell(row: 1, column: 6)))
        XCTAssertFalse(subject.isFinalColumm(Cell(row: 1, column: 5)))
    }

    func testLeftOfCell() {
        XCTAssertEqual(subject.leftOfCell(Cell(row: 1, column: 2)), Cell(row: 5, column: 3),
                "Last row should wrap to the first.")

        XCTAssertEqual(subject.leftOfCell(Cell(row: 2, column: 2)), Cell(row: 1, column: 3),
                "Should be one over and one up.")
    }

    func testCenterOfCell() {
        XCTAssertEqual(subject.centerOfCell(Cell(row: 1, column: 2)), Cell(row: 1, column: 3),
                "Should be one over.")
    }

    func testRightOfCell() {
        XCTAssertEqual(subject.rightOfCell(Cell(row: 5, column: 2)), Cell(row: 1, column: 3),
                "First row should wrap to the last.")

        XCTAssertEqual(subject.rightOfCell(Cell(row: 2, column: 2)), Cell(row: 3, column: 3),
                "Should be one over and one down.")
    }
}