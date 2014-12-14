//
//  ColorInfo.swift
//  WatchKitOpenAppDemo
//
//  Created by Natasha Murashev on 12/14/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class ColorInfo: NSObject {
    
    let color: UIColor
    let replyBlock: ([NSObject : AnyObject]!) -> Void
    
    init(userInfo: [NSObject : AnyObject], reply: ([NSObject : AnyObject]!) -> Void) {
        if let userInfo = userInfo as? [String : CGFloat] {
            switch (userInfo["red"], userInfo["green"], userInfo["blue"]) {
            case let (.Some(red), .Some(green), .Some(blue)):
                color = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
            default:
                color = UIColor.blackColor()
            }
        } else {
            color = UIColor.blackColor()
        }
        
        replyBlock = reply
    }
}
