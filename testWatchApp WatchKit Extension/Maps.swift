//
//  Maps.swift
//  testWatchApp WatchKit Extension
//
//  Created by De biasi, Anna (A.) on 7/26/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//


import WatchKit
import Foundation
import CoreMotion
import CoreLocation

class Maps: WKInterfaceController, CLLocationManagerDelegate {
    
    @IBOutlet var map: WKInterfaceMap!
    
    let manager = CLLocationManager()
    var motionManager = CMMotionManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(locations.coordinate.latitude, locations.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        manager.delegate = self
        manager.desiredAccuracy =  kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        var x = 0.0
        var y = 0.0
        var z = 0.0

        
        
        motionManager.gyroUpdateInterval = 0.2
        motionManager.startGyroUpdates(to: OperationQueue.current!){  (data,error) in
            if let myData = data{
                x += myData.rotationRate.x
                y += myData.rotationRate.y
                z += myData.rotationRate.z
                print( "x ", x, " y ", y, " z ", z)
            }

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
