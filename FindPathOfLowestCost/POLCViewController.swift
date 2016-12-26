//
//  ViewController.swift
//  FindPathOfLowestCost
//
//  Created by neelam on 15/12/16.
//  Copyright © 2016 neelam. All rights reserved.
//

import UIKit
import POLCSwiftLib

class POLCViewController: UIViewController {
    
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var lowestCostPathTextView: UITextView!
    @IBOutlet weak var successYN: UILabel!
    @IBOutlet weak var inputMatrixTextView: UITextView!
    
    //MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Starting Hard Code Input Value in UITextView
        self.inputMatrixTextView.text = "3,4,1,2,8,6\n6,1,8,2,7,4\n5,9,3,9,9,5\n8,4,1,3,2,6\n3,7,2,1,2,3"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Finding Lowest Cost Path in UI
    @IBAction func findLowestPath(_ sender: AnyObject) {
        
        let finalString = self.inputMatrixTextView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        // Constructor for Matrix
        let mat = Matrix(input: finalString)
        
        if let inputMat = mat
        {
            // Algorithm
            let algo = POLCAlgorithm()
            let tuple = algo.findPathOfLowestCostIn(inputMat)
            
            // Output
            self.successYN.text = tuple.0
            self.totalCostLabel.text = String(tuple.1)
            self.lowestCostPathTextView.text = String(describing: tuple.2)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Please enter valid input matrix with rows seperated by Enter key value for EX:\n3,4,1,2,8,6\n6,1,8,2,7,4\n5,9,3,9,9,5\n8,4,1,3,2,6\n3,7,2,1,2,5\nFor more detail go through Read Me file", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.successYN.text = "<Success>"
            self.totalCostLabel.text = "<Cost>"
            self.lowestCostPathTextView.text = "<Path of Lowest Cost>"
        }
    }
    
    
    
}

