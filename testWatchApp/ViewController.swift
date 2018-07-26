//
//  ViewController.swift
//  testWatchApp
//
//  Created by Low, Makena (M.) on 7/24/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           if (CLLocationManager.headingAvailable()) {
    
                locationManager  = CLLocationManager()
                locationManager.delegate = self
                locationManager.startUpdatingHeading()
        }

    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        // This will print out the direction the device is heading
        print(heading.trueHeading) }

    
    // https://www.quora.com/How-do-I-create-a-simple-compass-iOS-app-with-Swift-2-1-using-image-view-and-accelerometer
}

