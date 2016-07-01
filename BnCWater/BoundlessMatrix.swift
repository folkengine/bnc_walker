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

    func retrieveCellValue(cell: Cartesian) -> Int {
        return matrix[cell.y - 1][cell.x - 1]
    }

    func columnsCount() -> Int {
        return matrix[0].count
    }

    func rowsCount() -> Int {
        return matrix.count
    }

    func isFinalColumm(cell: Cartesian) -> Bool {
        return (cell.x == columnsCount())
    }

    func leftOfCell(cell: Cartesian) -> Cartesian {
        let row = cell.y == 1 ? rowsCount() : cell.y - 1
        return Cartesian(y: row, x: cell.x + 1)
    }

    func centerOfCell(cell: Cartesian) -> Cartesian {
        return Cartesian(y: cell.y, x: cell.x + 1)
    }

    func rightOfCell(cell: Cartesian) -> Cartesian {
        let row = cell.y == rowsCount() ? 1 : cell.y + 1
        return Cartesian(y: row, x: cell.x + 1)
    }

    var description: String {
        return matrix.map({row in row.map(String.init).joinWithSeparator(" ")}).joinWithSeparator(" \n")
    }

    class func factory(matrix: [[Int]]) -> BoundlessMatrix {
        return BoundlessMatrix(matrix: matrix)
    }
    
    /// Static factory method generating a instance with random values
    class func factory(dimensions: Cartesian) -> BoundlessMatrix {
        var arr = Array(count: dimensions.x, repeatedValue: Array(count: dimensions.y, repeatedValue: 0))
        for i in 0...(dimensions.x - 1) {
            arr[i] = (0...dimensions.y).map{_ in Int(arc4random_uniform(8) + 1)}
        }
        return BoundlessMatrix(matrix: arr)
    }
}