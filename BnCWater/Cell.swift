//
// Created by Christopher Baker on 6/30/16.
// Copyright (c) 2016 Christopher Baker. All rights reserved.
//

import Foundation

struct Cell {
    let row: Int
    let column: Int
    let value: Int

    func toCartesian() -> Cartesian {
        return Cartesian(y: column, x: row)
    }
}

extension Cell: Equatable {}
func ==(lhs: Cell, rhs: Cell) -> Bool {
    return lhs.row == rhs.row && lhs.column == rhs.column && lhs.value == rhs.value
}