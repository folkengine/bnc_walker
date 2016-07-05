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
    @IBOutlet var actionButton : UIButton!

    let resistance: Int = 50
    
    @IBAction func begin(sender : AnyObject) {
        let matrix: BoundlessMatrix = BoundlessMatrix.factory(Cartesian(x:8, y: 5))
        let walker = Walker(matrix: matrix)
        walker.walkTall()
        let result = Result(threshold: resistance, path: walker.bestWalk)

        NSLog("\(result)")
        
        matrixTextField.text = matrix.description
        successfulTextField.text = result.successful ? "Yes" : "No"
        sumTextField.text = String(result.sum)
        let walk: String = Walker.calculateWalk(result.completed).map({String($0)}).joinWithSeparator(" ")

        pathTextField.text = "\(walk)"
        
        matrixTextField.textAlignment = NSTextAlignment.Center
    
    }

    override func viewDidLoad() {
        styleActionButton()
        
        
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func styleActionButton() {
        actionButton.backgroundColor = UIColor.darkGrayColor()
        actionButton.layer.cornerRadius = 5
        actionButton.layer.borderWidth = 1
        actionButton.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func centerText() {
        
        var topCorrect : CGFloat = (matrixTextField.frame.height - matrixTextField.contentSize.height);
        topCorrect = topCorrect < 0.0 ? 0.0 : topCorrect / 2
        matrixTextField.contentOffset = CGPoint(x: 0, y: -topCorrect)
        
    }
    
}

