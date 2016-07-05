//
// Created by Christopher Baker on 7/4/16.
// Copyright (c) 2016 Christopher Baker. All rights reserved.
//

import Foundation

struct Result {
    let threshold: Int
    let path: [Cell]
    var completed: [Cell]
    var sum: Int

    init(threshold: Int, path: [Cell]) {
        self.threshold = threshold
        self.path = path

        self.completed = []
        self.sum = 0
        for cell in path {
            if (sum + cell.value > threshold) {
                return
            }
            self.sum += cell.value
            self.completed.append(cell)
        }
    }

    var successful: Bool {
        return Cell.sumOfValues(path) <= threshold
    }
}