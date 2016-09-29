//
//  ViewController.swift
//  tipcal
//
//  Created by Joel Lee on 9/25/16.
//  Copyright © 2016 Joel Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let KEY_BILL_AMOUNT = "bill_amount"
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let billAmt = defaults.objectForKey(KEY_BILL_AMOUNT)
        if(billField != nil) {
            billField.text = billAmt as? String
        }
    }

    override func viewWillAppear(animated: Bool) {
        //let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.objectForKey(KEY_TIP_PERCENT_INDEX)
        if(index != nil) {
            let indexInt = index!.integerValue
            if(tipControl.selectedSegmentIndex != indexInt) {
                tipControl.selectedSegmentIndex = indexInt
                tipControl.sendActionsForControlEvents(UIControlEvents.ValueChanged)
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        billField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercent = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        tipLabel.text = numberFormatter.stringFromNumber(tip)
        totalLabel.text = numberFormatter.stringFromNumber(total)
        
        saveBill()
    }
    
    func saveBill() {
        //let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(billField.text, forKey: KEY_BILL_AMOUNT)
        defaults.synchronize()
    }
}

