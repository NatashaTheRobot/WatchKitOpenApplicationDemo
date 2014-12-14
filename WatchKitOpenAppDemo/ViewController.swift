//
//  ViewController.swift
//  WatchKitOpenAppDemo
//
//  Created by Natasha Murashev on 12/11/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {
    
    var colorInfo: ColorInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleWatchKitNotification:"),
            name: "WatchKitSaysHello",
            object: nil)
    }

    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleWatchKitNotification(notification: NSNotification) {
        
        if let colorInfo = notification.object as? ColorInfo {
            
            view.backgroundColor = colorInfo.color
            
            self.colorInfo = colorInfo
        }
    }

    @IBAction func onPoloButtonTap(sender: AnyObject) {
        if let colorInfo = colorInfo {
            let randomColorComponents = [
                "red" : CGFloat(arc4random() % 255),
                "green" : CGFloat(arc4random() % 255),
                "blue" : CGFloat(arc4random() % 255)]
            
            
            colorInfo.replyBlock(randomColorComponents)
        }
    }

}

