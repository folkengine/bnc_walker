//
//  Walker.swift
//  BnCWater
//
//  Created by Christopher Baker on 7/1/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation

/// The current "brute force" version of the class seems like a dead end, but maybe isn't.
/// 
/// I've been working with it in a playground.
///
/// TODO: Add var value field to Cell struct to avoid tuple hell
class Walker {
    let matrix: BoundlessMatrix
    
    var stuff:[[(cell: Cell, value: Int)]] = [[]]
    
    init(matrix: BoundlessMatrix) {
        self.matrix = matrix
    }
    
    func step(cell: Cell, cells: [(cell: Cell, value: Int)]) {
        var r = cells
        let v = (cell: cell, value: matrix.retrieveCellValue(cell))
        r.append(v)
        if (matrix.isFinalColumm(cell)) {
            stuff.append(r)
            return
        }
        step(matrix.leftOfCell(cell), cells: r)
        step(matrix.centerOfCell(cell), cells: r)
        step(matrix.rightOfCell(cell), cells: r)
        
        return
    }
    
    /// I would figure out how to use reduce if I had had more sleep. :-P
    func sum(tupleRow: [(cell: Cell, value: Int)]) -> Int {
        var sum = 0;
        for c in tupleRow {
            sum += c.value
        }
        return sum
    }
    
    func pathOfLeastResistance() -> [Int] {
        return []
    }
}