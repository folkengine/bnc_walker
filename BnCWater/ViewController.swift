//
//  ViewController.swift
//  Test
//
//  Created by Christoph on 10/15/17.
//  Copyright © 2017 Christopher Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pathTextField: UITextField!
    @IBOutlet weak var sumTextField: UITextField!
    @IBOutlet weak var successfulTextField: UITextField!
    @IBOutlet weak var matrixTextView: UITextView!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var resistanceSlider: UISlider!
    @IBOutlet weak var resistanceLevel: UITextField!
    
    var resistance: Int = 50
    var matrix: BoundlessMatrix!

    @IBAction func begin(_ sender: UIButton) {
        let cart = Cartesian(x:8, y: 8)
        matrix = BoundlessMatrix.factory(dimensions: cart)
        NSLog("begin()")
        processMatrix()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        resistance = Int(sender.value)
        resistanceLevel.text = "\(resistance)"
        processMatrix()
    }
    
    func processMatrix() {
        let walker = Walker(matrix: matrix)
        walker.walkTall()
        let result = Result(threshold: resistance, path: walker.bestWalk)
        
        NSLog("\(result)")
        matrixTextView.text = matrix.description
        successfulTextField.text = result.successful ? "Great Success!" : "Unacceptable!!!"
        sumTextField.text = "SUM: \(String(result.sum))"
        
        let walk: String = Walker.calculateWalk(trail: result.completed).map({String($0)}).joined(separator: "\t")
        
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
