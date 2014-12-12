//
//  InterfaceController.swift
//  WatchKitOpenAppDemo WatchKit Extension
//
//  Created by Natasha Murashev on 12/11/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        NSLog("%@ awakeWithContext", self)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
    //MARK: Actions
    
    @IBAction func onRedButtonTap() {
        openParentAppWithColor("red")
    }
    
    @IBAction func onGreenButtonTap() {
        openParentAppWithColor("green")
    }
    
    @IBAction func onOrangeButtonTap() {
        openParentAppWithColor("orange")
    }

    @IBAction func onBlueButtonTap() {
        openParentAppWithColor("blue")
    }
    
    private func openParentAppWithColor(color: String) {
        WKInterfaceController.openParentApplication(["color" : color], reply: { (infoDict, error) -> Void in
            
        })
    }
}
