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

    func retrieveCellValue(cell: Cell) -> Int {
        return matrix[cell.row - 1][cell.column - 1]
    }

    func columnsCount() -> Int {
        return matrix[0].count
    }

    func rowsCount() -> Int {
        return matrix.count
    }

    func isFinalColumm(cell: Cell) -> Bool {
        return (cell.column == columnsCount())
    }

    func leftOfCell(cell: Cell) -> Cell {
        let row = cell.row == 1 ? rowsCount() : cell.row - 1
        return Cell(row: row, column: cell.column + 1)
    }

    func centerOfCell(cell: Cell) -> Cell {
        return Cell(row: cell.row, column: cell.column + 1)
    }

    func rightOfCell(cell: Cell) -> Cell {
        let row = cell.row == rowsCount() ? 1 : cell.row + 1
        return Cell(row: row, column: cell.column + 1)
    }

    var description: String {
        return matrix.map({row in row.map(String.init).joinWithSeparator(" ")}).joinWithSeparator(" \n")
    }

    class func factory(matrix: [[Int]]) -> BoundlessMatrix {
        return BoundlessMatrix(matrix: matrix)
    }
    
    /// Static factory method generating a instance with random values
    class func factory(dimensions: Dimensions) -> BoundlessMatrix {
        var arr = Array(count: dimensions.columns, repeatedValue: Array(count: dimensions.rows, repeatedValue: 0))
        for i in 0...(dimensions.columns - 1) {
            arr[i] = (0...dimensions.rows).map{_ in Int(arc4random_uniform(8) + 1)}
        }
        return BoundlessMatrix(matrix: arr)
    }
}