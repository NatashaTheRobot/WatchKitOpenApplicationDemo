//
//  ViewController.swift
//  WatchKitOpenAppDemo
//
//  Created by Natasha Murashev on 12/11/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleWatchKitNotification:"), name: "WatchKitSaysHello", object: nil)
    }

    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleWatchKitNotification(notification: NSNotification) {
        if let userInfo = notification.object as? [String : CGFloat] {
            switch (userInfo["red"], userInfo["green"], userInfo["blue"]) {
            case let (.Some(red), .Some(green), .Some(blue)):
                view.backgroundColor = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
            default:
                view.backgroundColor = UIColor.blackColor()
            }
        }
    }



}

