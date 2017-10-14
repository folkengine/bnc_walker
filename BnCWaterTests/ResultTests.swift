//
// Created by Christopher Baker on 7/4/16.
// Copyright (c) 2016 Christopher Baker. All rights reserved.
//

import Foundation
import XCTest

@testable import BnCWater

class ResultTests : XCTestCase {

    let matrix: BoundlessMatrix = BoundlessMatrix.factory(matrix: [
            [5, 4, 3, 2, 1, 5],
            [4, 3, 2, 1, 5, 4],
            [3, 2, 1, 5, 4, 3],
            [2, 1, 5, 4, 3, 2],
            [1, 5, 4, 3, 2, 1]])

    var walker: Walker!


    override func setUp() {
        super.setUp()
        walker = Walker(matrix: matrix)
        walker.walkTall()
    }

    func testPath() {
        let result = Result(threshold: 7, path: walker.bestWalk)
        XCTAssertEqual(result.path, [Cell(column: 1, row: 5, value: 1), Cell(column: 2, row: 4, value: 1), Cell(column: 3, row: 3, value: 1), Cell(column: 4, row: 2, value: 1), Cell(column: 5, row: 1, value: 1), Cell(column: 6, row: 5, value: 1)])
        XCTAssertEqual(result.completed, [Cell(column: 1, row: 5, value: 1), Cell(column: 2, row: 4, value: 1), Cell(column: 3, row: 3, value: 1), Cell(column: 4, row: 2, value: 1), Cell(column: 5, row: 1, value: 1), Cell(column: 6, row: 5, value: 1)])
        XCTAssertEqual(result.sum, 6)
    }

    func testSuccessful() {
        XCTAssertTrue(Result(threshold: 50, path: walker.bestWalk).successful)
        XCTAssertFalse(Result(threshold: 2, path: walker.bestWalk).successful)
    }

    func testCompleted() {
        let result = Result(threshold: 2, path: walker.bestWalk)
        XCTAssertFalse(result.successful)
        XCTAssertEqual(result.sum, 2)
        XCTAssertEqual(result.completed, [Cell(column: 1, row: 5, value: 1), Cell(column: 2, row: 4, value: 1)])
    }
}
