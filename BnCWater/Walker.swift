//
//  Walker.swift
//  BnCWater
//
//  Created by Christopher Baker on 7/1/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import Foundation

/// Walks through a matrix, caching sums, and returning the path of lest resistance.
///
/// TODO: Add ceiling to resistance sum.
class Walker {
    let matrix: BoundlessMatrix

    var bestWalk: [Cell] = []
    var bestWalkSum: Int = 0
    var breadcrumb: [Cartesian:Cell] = [:]
    
    init(matrix: BoundlessMatrix) {
        self.matrix = matrix
    }

    /// Walk the walk. Then return the path of least resistance.
    func pathOfLeastResistance() -> [Int] {
        if (bestWalk == []) {
            walkTall()
        }
        return Walker.calculateWalk(bestWalk)
    }

    func submitCandidate(candidate: [Cell]) {
        let candidateSum = Cell.sumOfValues(candidate)

        if ((bestWalkSum == 0) || (candidateSum < bestWalkSum)) {
            NSLog("New best walk: \(candidateSum) \(Walker.calculateWalk(candidate)) ")
            bestWalk = candidate
            bestWalkSum = candidateSum
        }
    }

    func addBreadcrumb(cell: Cell) {
        addBreadcrumb(cell, trail: [cell])
    }

    func addBreadcrumb(cell: Cell, trail: [Cell]) {
        breadcrumb[cell.toCartesian()] = cell.toCartesian().toCell(Cell.sumOfValues(trail)) // 8-)
    }

    func hasBreadcrumb(xy: Cartesian) -> Bool {
        return (breadcrumb[xy] != nil)
    }

    func hasBreadcrumb(cell: Cell) -> Bool {
        return hasBreadcrumb(cell.toCartesian())
    }

    /// If the path's sum is lower than an existing path that hits the same Cell, continue, otherwise bail.
    func isWorthyOfContinuing(cell: Cell, trail: [Cell]) -> Bool {
        if (hasBreadcrumb(cell) && (breadcrumb[cell.toCartesian()]!.value <= Cell.sumOfValues(trail))) {
            NSLog("Rejecting EX: \(breadcrumb[cell.toCartesian()]!.value) V: \(Cell.sumOfValues(trail)) \(trail)")
            return false
        }
        addBreadcrumb(cell, trail: trail)
        return true
    }

    /// Walk through each starting Cell, going from lowest value to highest. 
    func walkTall() {
        for cell in matrix.sortedStartingCells() {
            startStepping(cell.toCartesian())
        }
    }

    func startStepping(xy: Cartesian) {
        step(matrix.retrieveCell(xy), cells: [])
    }

    /// Recursive function that goes through each Cell underneath it. When it gets to the end, submit its path
    /// as a candidate for the best path.
    func step(cell: Cell, cells: [Cell]) {
        var candidate = cells
        candidate.append(cell)
        if (matrix.isFinalColumn(cell.toCartesian())) {
            submitCandidate(candidate)
            return
        }

        // TODO: Good candidates for a lambda
        let left = matrix.leftOfCell(cell.toCartesian())
        if (isWorthyOfContinuing(left, trail: candidate)) {
            step(left, cells: candidate)
        }

        let center = matrix.centerOfCell(cell.toCartesian())
        if (isWorthyOfContinuing(center, trail: candidate)) {
            step(center, cells: candidate)
        }

        let right = matrix.rightOfCell(cell.toCartesian())
        if (isWorthyOfContinuing(right, trail: candidate)) {
            step(right, cells: candidate)
        }
    }

    class func calculateWalk(trail: [Cell]) -> [Int] {
        return trail.map({$0.row})
    }
}