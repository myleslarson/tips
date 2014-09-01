//
//  ViewController.swift
//  tips
//
//  Created by Myles Larson on 8/31/14.
//  Copyright (c) 2014 Myles Larson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customTipField: UITextField!

    var customTip = 0.2
    var customTipEntered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "Tip $0.00"
        totalLabel.text = "Total $0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.2, 0.25, customTip]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if tipControl.selectedSegmentIndex == 3 {
            customTipField.hidden = false
        } else {
            customTipField.hidden = true
            if customTipEntered == false {
                customTip = tipPercentage
            }
        }

        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "Tip $\(tip)"
        totalLabel.text = "Total $\(total)"
        
        tipLabel.text = String(format: "Tip $%.2f", tip)
        totalLabel.text = String(format: "Total $%.2f", total)
    }
    
    @IBAction func customTipEditingChanged(sender: AnyObject) {
        customTipEntered = true
        customTip = NSString(string: customTipField.text).doubleValue * 0.01
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

