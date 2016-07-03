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
        XCTAssertEqual(subject.retrieveCell(Cartesian(x: 5, y: 1)), Cell(row: 5, column: 1, value: 2))
        XCTAssertEqual(subject.retrieveCell(Cartesian(x: 4, y: 2)), Cell(row: 4, column: 2, value: 4))
    }

    func testColumnsCount() {
        XCTAssertEqual(subject.columnsCount(), 6)
    }

    func testRowsCount() {
        XCTAssertEqual(subject.rowsCount(), 5)
    }

    func testIsFinalColumm() {
        XCTAssertTrue(subject.isFinalColumm(Cartesian(x: 6, y: 1)))
        XCTAssertFalse(subject.isFinalColumm(Cartesian(x: 5, y: 1)))
    }

    func testLeftOfCellMotion() {
        XCTAssertEqual(subject.leftOfCell(Cartesian(x: 2, y: 1)).toCartesian(), Cartesian(x: 3, y: 5),
                "Last row should wrap to the first.")

        XCTAssertEqual(subject.leftOfCell(Cartesian(x: 2, y: 2)).toCartesian(), Cartesian(x: 3, y: 1),
                "Should be one over and one up.")
    }

    func testCenterOfCellMotion() {
        XCTAssertEqual(subject.centerOfCell(Cartesian(x: 2, y: 1)).toCartesian(), Cartesian(x: 3, y: 1),
                "Should be one over.")
    }

    func testRightOfCellMotion() {
        XCTAssertEqual(subject.rightOfCell(Cartesian(x: 2, y: 5)).toCartesian(), Cartesian(x: 3, y: 1),
                "First row should wrap to the last.")

        XCTAssertEqual(subject.rightOfCell(Cartesian(x: 2, y: 2)).toCartesian(), Cartesian(x: 3, y: 3),
                "Should be one over and one down.")
    }
}