//
//  Temp.swift
//  testWatchApp WatchKit Extension
//
//  Created by De biasi, Anna (A.) on 7/27/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//


import WatchKit
import Foundation
import WatchConnectivity


class Temp: WKInterfaceController {
    
    let session = WCSession.default

    @IBOutlet var temp: WKInterfaceLabel!
    @IBOutlet var tempSet: WKInterfaceLabel!
    
    // Raises temperature by one degrees
    @IBAction func plus() {
        // Notifies user that the temp was set
        if(tempSet.description == "Not Set"){
            tempSet.setText("Set")
        }
        if(temp.description != "60" && temp.description != "80"){
            if( WCSession.default.isReachable){
                temp.setText(String(Int(temp.description)! + 1))
                WCSession.default.sendMessage(["temp":temp.description] , replyHandler: nil)
            }
        }
    }
    
    // Lowers temperature by one degrees
    @IBAction func minus() {
        // Notifies user that the temp was set
        if(tempSet.description == "Not Set"){
            tempSet.setText("Set")
        }
        if(temp.description != "60" && temp.description != "80"){
            if( WCSession.default.isReachable){
                temp.setText(String(Int(temp.description)! - 1))
                WCSession.default.sendMessage(["temp":temp.description] , replyHandler: nil)
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        session.delegate = self as? WCSessionDelegate
        session.activate()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    
  
    
}
