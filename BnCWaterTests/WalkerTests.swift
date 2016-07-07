//
//  WalkerTests.swift
//  BnCWater
//
//  Created by Christopher Baker on 7/1/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation
import XCTest

@testable import BnCWater

class WalkerTests: XCTestCase {

    var protagonist: Walker!

    let matrix: BoundlessMatrix = BoundlessMatrix.factory([
            [1, 5, 4, 3, 2, 1],
            [2, 1, 5, 4, 3, 2],
            [3, 2, 1, 5, 4, 3],
            [4, 3, 2, 1, 5, 4],
            [5, 4, 3, 2, 1, 5]])
    let strong = Cell(column: 5, row: 4, value: 9)
    let middlin = Cell(column: 5, row: 4, value: 3)
    let weak = Cell(column: 4, row: 4, value: 1)

    override func setUp() {
        super.setUp()
        protagonist = Walker(matrix: matrix)
    }

    func testStartStepping_shortest() {
        protagonist.startStepping(Cartesian(x: 6, y: 1))

        XCTAssertEqual(protagonist.bestWalk, [Cell(column: 6, row: 1, value: 1)])
    }

    func testBestStep() {
        protagonist.startStepping(Cartesian(x: 1, y: 1))

        let walk = Walker.calculateWalk(protagonist.bestWalk)

        XCTAssertEqual(walk, [1, 2, 3, 4, 5, 1])
    }

    func test2ndBestStep() {
        protagonist.startStepping(Cartesian(x: 1, y: 2))

        let walk = Walker.calculateWalk(protagonist.bestWalk)

        XCTAssertEqual(walk, [2, 2, 3, 4, 5, 1])
    }

    func test3ndBestStep() {
        protagonist.startStepping(Cartesian(x: 1, y: 3))

        let walk = Walker.calculateWalk(protagonist.bestWalk)

        XCTAssertEqual(walk, [3, 2, 3, 4, 5, 1])
    }

    func test4thBestStep() {
        protagonist.startStepping(Cartesian(x: 1, y: 4))

        let walk = Walker.calculateWalk(protagonist.bestWalk)

        XCTAssertEqual(walk, [4, 3, 3, 4, 5, 1])
    }

    func testWorstBestStep() {
        protagonist.startStepping(Cartesian(x: 1, y: 5))

        let walk = Walker.calculateWalk(protagonist.bestWalk)

        XCTAssertEqual(walk, [5, 4, 3, 4, 5, 1])
    }

    func testPathOfLeastResistance() {
        XCTAssertEqual(protagonist.pathOfLeastResistance(), [1, 2, 3, 4, 5, 1])
    }

    func testPathOfLeastResistance_inverse() {
        let inverse_matrix: BoundlessMatrix = BoundlessMatrix.factory([
                [5, 4, 3, 2, 1, 5],
                [4, 3, 2, 1, 5, 4],
                [3, 2, 1, 5, 4, 3],
                [2, 1, 5, 4, 3, 2],
                [1, 5, 4, 3, 2, 1]])
        let walker = Walker(matrix: inverse_matrix)

        XCTAssertEqual(walker.pathOfLeastResistance(), [5, 4, 3, 2, 1, 5])
        print(walker.bestWalk)
    }

    func testAddBreadcrumb() {
        protagonist.addBreadcrumb(strong)

        XCTAssertTrue(protagonist.hasBreadcrumb(middlin))
        XCTAssertTrue(protagonist.hasBreadcrumb(middlin.toCartesian()))
        XCTAssertFalse(protagonist.hasBreadcrumb(weak))

        protagonist.addBreadcrumb(weak)
        XCTAssertTrue(protagonist.hasBreadcrumb(weak.toCartesian()))
    }

    func testIsWorthyOfContinuing() {
        let best = Cell(column: 5, row: 4, value: 1)
        protagonist.addBreadcrumb(middlin)

        XCTAssertTrue(protagonist.hasBreadcrumb(middlin))
        XCTAssertFalse(protagonist.isWorthyOfContinuing(strong, trail: [strong]))
        XCTAssertTrue(protagonist.isWorthyOfContinuing(best, trail: [best]))
        XCTAssertEqual(protagonist.breadcrumb[best.toCartesian()]!.value, 1)
    }
    
    func testMaxGrid() {
        let matrix: BoundlessMatrix = BoundlessMatrix.factory(Cartesian(x:100, y: 10))
    }

    func testCalculateWalk() {
        XCTAssertEqual(
                Walker.calculateWalk([
                        Cell(column: 1, row: 1, value: 1),
                        Cell(column: 2, row: 2, value: 1),
                        Cell(column: 3, row: 3, value: 1)]),
                [1, 2, 3])
    }
}
