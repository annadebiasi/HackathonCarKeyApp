//
//  InterfaceController.swift
//  testWatchApp WatchKit Extension
//
//  Created by Low, Makena (M.) on 7/24/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import UIKit

class InterfaceController: WKInterfaceController {
    

    var lockStatus = "none"
    let session = WCSession.default
    
//    @IBOutlet var unlockButton: WKInterfaceButton!
//    @IBOutlet var lockButton: WKInterfaceButton!
    @IBAction func unlock() {
//        if (lockStatus != "unlock"){
//            lockStatus = "unlock"
            //self.unlockButton.setBackgroundColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
        
        session.sendMessage(["Lock Status":"Unlock"], replyHandler: nil, errorHandler: { error in
            print("Error sending message ",error)
            })
    }
//        else{
//            lockStatus = "none"
//          //  self.unlockButton.setBackgroundColor(#colorLiteral(red: 0.9727308783, green: 0.9879265731, blue: 1, alpha: 0))
//        }
//    }
    
    @IBAction func lock() {
        if (lockStatus != "lock"){
            lockStatus = "lock"
           // self.unlockButton.setBackgroundColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            if( WCSession.default.isReachable){
            WCSession.default.sendMessage(["Lock Status":"Lock"] , replyHandler: nil)
        }
        else{
            lockStatus = "none"
           // self.lockButton.setBackgroundColor(#colorLiteral(red: 0.9727308783, green: 0.9879265731, blue: 1, alpha: 0))
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
//        session.delegate = self as WCSessionDelegate
//        session.activate()
        if WCSession.isSupported() {
            print("WCSession supported")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    
    
}


