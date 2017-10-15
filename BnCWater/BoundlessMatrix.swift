//
//  BoundlessMatrix.swift
//  BnCWater
//
//  Created by Christopher Baker on 6/29/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation

class BoundlessMatrix : CustomStringConvertible {
    
    let matrix: [[Int]]
    
    init (matrix: [[Int]]) {
        self.matrix = matrix
    }

    func retrieveCell(xy: Cartesian) -> Cell {
        return xy.toCell(value: matrix[xy.y - 1][xy.x - 1])
    }

    func columnsCount() -> Int {
        return matrix[0].count
    }

    func rowsCount() -> Int {
        return matrix.count
    }

    func isFinalColumn(xy: Cartesian) -> Bool {
        return (xy.x == columnsCount())
    }

    func leftOfCell(xy: Cartesian) -> Cell {
        let row = xy.y == 1 ? rowsCount() : xy.y - 1
        return retrieveCell(xy: Cartesian(x: xy.x + 1, y: row))
    }

    func centerOfCell(xy: Cartesian) -> Cell {
        return retrieveCell(xy: Cartesian(x: xy.x + 1, y: xy.y))
    }


    func rightOfCell(xy: Cartesian) -> Cell {
        let row = xy.y == rowsCount() ? 1 : xy.y + 1
        return retrieveCell(xy: Cartesian(x: xy.x + 1, y: row))
    }

    func sortedStartingCells() -> [Cell] {
        return Cell.sort(cells: Array(1...self.rowsCount()).map( { (i) -> Cell in self.retrieveCell(xy: Cartesian(x: 1, y: i)) }))
    }

    var description: String {
        return matrix.map({row in row.map(String.init).joined(separator: " ")}).joined(separator: " \n")
    }

    class func factory(matrix: [[Int]]) -> BoundlessMatrix {
        return BoundlessMatrix(matrix: matrix)
    }
    
    /// Static factory method generating a instance with random values
    class func factory(dimensions: Cartesian) -> BoundlessMatrix {
        var arr = Array(repeating: Array(repeating: 0, count: dimensions.x), count: dimensions.y)
        for i in 0...(dimensions.y - 1) {
            arr[i] = (0...dimensions.x).map{_ in Int(arc4random_uniform(8) + 1)}
        }
        return BoundlessMatrix(matrix: arr)
    }
}
