//
//  Maps.swift
//  testWatchApp WatchKit Extension
//
//  Created by De biasi, Anna (A.) on 7/26/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//


import WatchKit
import Foundation
import CoreLocation

class Maps: WKInterfaceController, CLLocationManagerDelegate {

    @IBOutlet var map: WKInterfaceMap!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

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
