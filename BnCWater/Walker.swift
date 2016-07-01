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
    
    var stuff:[[Cell]] = [[]]
    
    init(matrix: BoundlessMatrix) {
        self.matrix = matrix
    }
    
    func step(xy: Cartesian, cells: [Cell]) {
        var r = cells
        let v = matrix.retrieveCell(xy)
        r.append(v)
        if (matrix.isFinalColumm(xy)) {
            stuff.append(r)
            return
        }
        step(matrix.leftOfCell(xy), cells: r)
        step(matrix.centerOfCell(xy), cells: r)
        step(matrix.rightOfCell(xy), cells: r)
        
        return
    }
    
    /// I would figure out how to use reduce if I had had more sleep. :-P
    func sum(tupleRow: [(cell: Cartesian, value: Int)]) -> Int {
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