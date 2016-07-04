//
//  Cartesian.swift
//  BnCWater
//
//  Created by Christopher Baker on 6/29/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation

struct Cartesian: Hashable {
    let x: Int
    let y: Int

    func toCell(value: Int) -> Cell {
        return Cell(column: x, row: y, value: value)
    }

    var hashValue: Int {
        return (31 &* y.hashValue) &+ x.hashValue
    }
}

func ==(lhs: Cartesian, rhs: Cartesian) -> Bool {
    return lhs.y == rhs.y && lhs.x == rhs.x
}
