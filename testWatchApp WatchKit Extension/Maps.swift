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
    let locationManager:CLLocationManager = CLLocationManager()
    var currentLocation = CLLocation()
    var parkingLocation : Array<Double> = []
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        UserDefaults.standard.set([39.509,-124.345], forKey: "parking")
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        parkingLocation = UserDefaults.standard.array(forKey: "parking") as! Array<Double>
      
       // let locations = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region)
    }
}
