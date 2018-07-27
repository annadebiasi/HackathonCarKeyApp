//
//  Music.swift
//  testWatchApp WatchKit Extension
//
//  Created by De biasi, Anna (A.) on 7/27/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class Music: WKInterfaceController {
    
    var session : WCSession?
    @IBOutlet var musicStation: WKInterfaceLabel!
    @IBOutlet var tempSet: WKInterfaceLabel!
    
    
    @IBAction func minus() {
        // Notifies user that the temp was set
        if(tempSet.description == "Not Set"){
            tempSet.setText("Set")
        }
        
        if(musicStation.description != "88" && musicStation.description != "107"){
            if (session?.isReachable)! {
                musicStation.setText(String(Double(musicStation.description)! - 0.1))
                session?.sendMessage(["music":musicStation.description], replyHandler: nil, errorHandler: { error in
                print("Error sending message",error)
                })
            }
        }
    }
    
    @IBAction func plus() {
        // Notifies user that the temp was set
        if(tempSet.description == "Not Set"){
            tempSet.setText("Set")
        }
        
        if(musicStation.description != "88" && musicStation.description != "107"){
            if( session?.isReachable)!{
                print("HEYYPOOO")
                musicStation.setText(String(Double(musicStation.description)! + 0.1))
                //session?.sendMessage(["music":musicStation.description] , replyHandler: nil, errorHandler: { error in
                  //  print("Error sending message",error)
             //   })
            }
        }
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if WCSession.isSupported() {
            print("WCSession supported")
            session = WCSession.default
            session!.delegate = self as WCSessionDelegate
            session!.activate()
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

extension Music: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
}

