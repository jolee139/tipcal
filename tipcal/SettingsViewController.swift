//
//  SettingsViewController.swift
//  tipcal
//
//  Created by Joel Lee on 9/27/16.
//  Copyright © 2016 Joel Lee. All rights reserved.
//

import UIKit

let KEY_TIP_PERCENT_INDEX = "tip_percent_index"

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControlSetting: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.objectForKey(KEY_TIP_PERCENT_INDEX)
        if(index != nil) {
            tipControlSetting.selectedSegmentIndex = index!.integerValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTipPercent(sender: AnyObject) {
        // save percentage
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControlSetting.selectedSegmentIndex, forKey: KEY_TIP_PERCENT_INDEX)
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
