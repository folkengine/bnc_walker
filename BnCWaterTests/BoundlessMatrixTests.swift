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
        XCTAssertEqual(subject.retrieveCellValue(Cartesian(y: 1, x: 5)), 2)
        XCTAssertEqual(subject.retrieveCellValue(Cartesian(y: 2, x: 4)), 4)
    }

    func testColumnsCount() {
        XCTAssertEqual(subject.columnsCount(), 6)
    }

    func testRowsCount() {
        XCTAssertEqual(subject.rowsCount(), 5)
    }

    func testIsFinalColumm() {
        XCTAssertTrue(subject.isFinalColumm(Cartesian(y: 1, x: 6)))
        XCTAssertFalse(subject.isFinalColumm(Cartesian(y: 1, x: 5)))
    }

    func testLeftOfCell() {
        XCTAssertEqual(subject.leftOfCell(Cartesian(y: 1, x: 2)), Cartesian(y: 5, x: 3),
                "Last row should wrap to the first.")

        XCTAssertEqual(subject.leftOfCell(Cartesian(y: 2, x: 2)), Cartesian(y: 1, x: 3),
                "Should be one over and one up.")
    }

    func testCenterOfCell() {
        XCTAssertEqual(subject.centerOfCell(Cartesian(y: 1, x: 2)), Cartesian(y: 1, x: 3),
                "Should be one over.")
    }

    func testRightOfCell() {
        XCTAssertEqual(subject.rightOfCell(Cartesian(y: 5, x: 2)), Cartesian(y: 1, x: 3),
                "First row should wrap to the last.")

        XCTAssertEqual(subject.rightOfCell(Cartesian(y: 2, x: 2)), Cartesian(y: 3, x: 3),
                "Should be one over and one down.")
    }
}