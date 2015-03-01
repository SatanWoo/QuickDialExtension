//
//  TodayViewController.swift
//  QuickDial Widget
//
//  Created by z on 15-3-1.
//  Copyright (c) 2015年 SatanWoo. All rights reserved.
//

import UIKit
import NotificationCenter
import QuickDialKit

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var keyPadView: UIView!
    
    let WZKeyPadDigitNumber = 9;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.phoneNumberLabel.text! = "";
        self.configureDigitButton();
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureDigitButton() {
        for view in self.keyPadView.subviews {
            if view.tag <= self.WZKeyPadDigitNumber {
                view.layer.cornerRadius = 18.5;
                view.layer.masksToBounds = true;
            }
        }
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero;
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
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
            DialPhoneManager.dial(text);
        }
    }
}
