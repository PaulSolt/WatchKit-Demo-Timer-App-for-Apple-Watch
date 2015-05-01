//
//  InterfaceController.swift
//  Timer for Apple Watch WatchKit Extension
//
//  Created by Paul Solt on 11/20/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var watchTimer: WKInterfaceTimer!
    
    var doneTimer: NSTimer?
    var duration: NSTimeInterval = 60.0 * 3.0  // number of seconds (3 minutes)
    
    override init() {
        super.init()
        // Configure interface objects here.
        println("\(self) init")
    }
//    override init(context: AnyObject?) {
//        // Initialize variables here.
//        super.init(context: context)
//        
//        // Configure interface objects here.
////        NSLog("%@ init", self)
//        println("\(self) init")
//    }

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

    @IBAction func startButtonPressed() {
        
        println("Start!")
        watchTimer.setDate(NSDate(timeIntervalSinceNow: duration))
        watchTimer.start()
        
        
        doneTimer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: Selector("timerDone:"), userInfo: nil, repeats: false)
        
    }
    
    func timerDone(timer: NSTimer) {
        println("Done!")
    }
    
}
