//
//  ViewController.swift
//  testWatchApp
//
//  Created by Low, Makena (M.) on 7/24/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//

import UIKit
import CoreLocation
import CocoaMQTT
import WatchConnectivity


class ViewController: UIViewController,WCSessionDelegate, CLLocationManagerDelegate {
    
    let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "19.32.136.146", port: 1883)
    
    var session: WCSession?

    var temperature: String = " "
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
       
        if((applicationContext["temp"]) != nil){
            temperature = (applicationContext["temp"] as? String)!
            print(temperature)
            mqttClient.publish("temp", withString: temperature)
        }
        if((applicationContext["music"]) != nil){
            temperature = (applicationContext["music"] as? String)!
            mqttClient.publish("music", withString: temperature)
        }
        if((applicationContext["Lock Status"]) != nil){
            temperature = (applicationContext["Lock Status"] as? String)!
            mqttClient.publish("rpi/temp", withString: temperature)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (WCSession.isSupported()) {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
        
//var headingManager:CLLocationManager!
// var locationManager  = CLLocationManager()

//        UserDefaults.standard.set([39.509,-124.345], forKey: "parking")
//        // Ask for Authorisation from the User.
//        self.locationManager.requestAlwaysAuthorization()
//
//        // For use in foreground
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if (CLLocationManager.headingAvailable() && CLLocationManager.locationServicesEnabled()) {
//            locationManager.delegate = self
//            locationManager.startUpdatingHeading()
//            //locationManager.stopUpdatingHeading()
//
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//         //   locationManager.startUpdatingLocation()
     //   }
    }
    
//    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        //print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
//
//    internal func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
//      //  print(heading.trueHeading)
//    }

    // https://www.quora.com/How-do-I-create-a-simple-compass-iOS-app-with-Swift-2-1-using-image-view-and-accelerometer
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }

}

