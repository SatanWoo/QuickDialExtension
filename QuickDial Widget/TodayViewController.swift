//
//  TodayViewController.swift
//  QuickDial Widget
//
//  Created by z on 15-3-1.
//  Copyright (c) 2015年 SatanWoo. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero;
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.NoData)
    }
    
    @IBAction func didPressDigitalButton(sender: UIButton) {
        let digit = sender.tag;
        if let text = self.phoneNumberLabel.text {
            self.phoneNumberLabel.text = self.phoneNumberLabel.text! + "\(digit)";
        } else {
            self.phoneNumberLabel.text = "\(digit)";
        }
    }
    
    @IBAction func didPressDeleteButton(sender: UIButton) {
        if let text = self.phoneNumberLabel.text {
            self.phoneNumberLabel.text = self.phoneNumberLabel.text!.substringToIndex(text.endIndex.predecessor());
        }
    }
    
    
    @IBAction func didPressDialButton(sender: UIButton) {
        if let text = self.phoneNumberLabel.text {
            //PhoneCallHelper.dialPhone(text);
        }
    }
}
