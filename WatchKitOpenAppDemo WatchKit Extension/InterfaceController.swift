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

    @IBOutlet weak var colorGroup: WKInterfaceGroup!
    
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
    
    //
    //  InterfaceController.swift
    //  WatchKitOpenAppDemo WatchKit Extension
    
    @IBAction func onMarcoButtonTap() {
        
        let randomColorComponents = [
            "red" : CGFloat(arc4random() % 255),
            "green" : CGFloat(arc4random() % 255),
            "blue" : CGFloat(arc4random() % 255)]
        
        WKInterfaceController.openParentApplication(randomColorComponents,
            reply: { [unowned self](reply, error) -> Void in
            
            if let reply = reply as? [String : CGFloat] {
                switch (reply["red"], reply["green"], reply["blue"]) {
                case let (.Some(red), .Some(green), .Some(blue)):
                    
                    let color = UIColor(
                        red: red/255.0,
                        green: green/255.0,
                        blue: blue/255.0,
                        alpha: 1.0)
                    
                    self.colorGroup.setBackgroundColor(color)
                default:
                    self.colorGroup.setBackgroundColor(UIColor.blackColor())
                }
            } else {
                self.colorGroup.setBackgroundColor(UIColor.blackColor())
            }

            
        })

    }

}