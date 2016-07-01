//
//  Cartesian.swift
//  BnCWater
//
//  Created by Christopher Baker on 6/29/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation

struct Cartesian {
    let y: Int
    let x: Int

    func toCell(value: Int) -> Cell {
        return Cell(row: x, column: y, value: value)
    }
}

extension Cartesian: Equatable {}
func ==(lhs: Cartesian, rhs: Cartesian) -> Bool {
    return lhs.y == rhs.y && lhs.x == rhs.x
}
