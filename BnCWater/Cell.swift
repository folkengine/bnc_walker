//
// Created by Christopher Baker on 6/30/16.
// Copyright (c) 2016 Christopher Baker. All rights reserved.
//

import Foundation

struct Cell: Hashable {
    let column: Int
    let row: Int
    let value: Int

    func toCartesian() -> Cartesian {
        return Cartesian(x: column, y: row)
    }

    static func sort(cells: [Cell]) -> [Cell] {
        return cells.sort{ $0.value < $1.value }
    }

    static func mostPassive(cells: [Cell]) -> Cell {
        return sort(cells)[0]
    }

    static func sumOfValues(cells: [Cell]) -> Int {
        return cells.reduce(0, combine: {$0 + $1.value})
    }

    var hashValue: Int {
        var result: Int = (row ^ (row >> 32))
        result = 31 * result + (column ^ (column >> 32))
        result = 31 * result + (value ^ (value >> 32))
        return result
    }
}

func ==(lhs: Cell, rhs: Cell) -> Bool {
    return lhs.row == rhs.row && lhs.column == rhs.column && lhs.value == rhs.value
}
