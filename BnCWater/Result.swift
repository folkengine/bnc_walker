//
// Created by Christopher Baker on 7/4/16.
// Copyright (c) 2016 Christopher Baker. All rights reserved.
//

import Foundation

struct Result {
    let threshold: Int
    let path: [Cell]

    var successful: Bool {
        return Cell.sumOfValues(path) <= threshold
    }

//    var completed: []
}