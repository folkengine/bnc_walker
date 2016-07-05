//
//  ViewController.swift
//  BnCWater
//
//  Created by Christopher Baker on 6/27/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var matrixTextField : UITextView!
    @IBOutlet var successfulTextField : UITextField!
    @IBOutlet var sumTextField : UITextField!
    @IBOutlet var pathTextField : UITextField!

    let resistance: Int = 50
    
    @IBAction func begin(sender : AnyObject) {
        let matrix: BoundlessMatrix = BoundlessMatrix.factory(Cartesian(x:6, y: 5))
        let walker = Walker(matrix: matrix)
        walker.walkTall()
        let result = Result(threshold: resistance, path: walker.bestWalk)

        NSLog("\(result)")
        
        matrixTextField.text = matrix.description
        successfulTextField.text = result.successful ? "Yes" : "No"
        sumTextField.text = String(result.sum)
        let walk: String = Walker.calculateWalk(result.completed).map({String($0)}).joinWithSeparator(" ")

        pathTextField.text = "\(walk)"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

