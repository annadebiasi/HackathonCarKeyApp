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
    //var headingManager:CLLocationManager!
    var locationManager  = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set([39.509,-124.345], forKey: "parking")
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if (CLLocationManager.headingAvailable() && CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.startUpdatingHeading()
            //locationManager.stopUpdatingHeading()

            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
         //   locationManager.startUpdatingLocation()
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
      //  print(heading.trueHeading)
    }
    
    // https://www.quora.com/How-do-I-create-a-simple-compass-iOS-app-with-Swift-2-1-using-image-view-and-accelerometer
}

