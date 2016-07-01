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

    var matrix: BoundlessMatrix = BoundlessMatrix.factory([
            [1, 5, 4, 3, 2, 1],
            [2, 1, 5, 4, 3, 2],
            [3, 2, 1, 5, 4, 3],
            [4, 3, 2, 1, 5, 4],
            [5, 4, 3, 2, 1, 5]])

    func testStep() {
        let enter = Walker(matrix: matrix)
        enter.step(Cartesian(y: 1, x: 1), cells: [])
        print(enter.stuff)
    }
}
