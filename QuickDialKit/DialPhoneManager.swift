//
//  DialPhoneManager.swift
//  QuickDial
//
//  Created by z on 15-3-1.
//  Copyright (c) 2015年 SatanWoo. All rights reserved.
//

import UIKit

public class DialPhoneManager:NSObject {
    public class func dial(phoneNumber:String) {
        let url:NSURL? = NSURL(string: "tel://\(phoneNumber)");
        UIApplication.sharedApplication().openURL(url!);
    }
}
