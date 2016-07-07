//
//  ViewController.swift
//  BnCWater
//
//  Created by Christopher Baker on 6/27/16.
//  Copyright © 2016 Christopher Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var matrixTextField: UITextView!
    @IBOutlet var successfulTextField: UITextField!
    @IBOutlet var sumTextField: UITextField!
    @IBOutlet var pathTextField: UITextField!
    @IBOutlet var actionButton: UIButton!
    
    @IBOutlet var resistanceSlider: UISlider!
    @IBOutlet var resistanceLevel: UITextField!

    var resistance: Int = 50
    var matrix: BoundlessMatrix!
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        resistance = Int(sender.value)
        resistanceLevel.text = "\(resistance)"
        processMatrix()
    }
    
    @IBAction func begin(sender : AnyObject) {
        matrix = BoundlessMatrix.factory(Cartesian(x:6, y: 100))
        processMatrix()
    }
    
    func processMatrix() {
        let walker = Walker(matrix: matrix)
        walker.walkTall()
        let result = Result(threshold: resistance, path: walker.bestWalk)
        
        NSLog("\(result)")
        
        matrixTextField.text = matrix.description
        successfulTextField.text = result.successful ? "Yes" : "No"
        sumTextField.text = String(result.sum)
        let walk: String = Walker.calculateWalk(result.completed).map({String($0)}).joinWithSeparator("\t")
        
        pathTextField.text = "\(walk)"
        resistanceLevel.text = "\(resistance)"
        
        matrixTextField.textAlignment = NSTextAlignment.Center
    }

    override func viewDidLoad() {
        styleActionButton()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
