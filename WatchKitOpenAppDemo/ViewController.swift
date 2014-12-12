//
//  ViewController.swift
//  WatchKitOpenAppDemo
//
//  Created by Natasha Murashev on 12/11/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    private enum Color: String {
        case Red = "red"
        case Green = "green"
        case Orange = "orange"
        case Blue = "blue"
        
        func color() -> UIColor {
            switch self {
            case Red:
                return UIColor.redColor()
            case .Green:
                return UIColor.greenColor()
            case .Orange:
                return UIColor.orangeColor()
            case .Blue:
                return UIColor.blueColor()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleWatchKitNotification:"), name: "WatchKitSaysHello", object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        super.viewDidDisappear(animated)
    }
    
    func handleWatchKitNotification(notification: NSNotification) {
        if let userInfo = notification.object as? [String : String] {
            if let colorStr = userInfo["color"] {
                let color = Color(rawValue: colorStr)
                view.backgroundColor = color?.color()
            }
        }
    }



}

