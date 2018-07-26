//
//  ViewController.swift
//  testWatchApp
//
//  Created by Low, Makena (M.) on 7/24/18.
//  Copyright © 2018 Low, Makena (M.). All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    var motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
                motionManager.deviceMotionUpdateInterval = 0.1
                motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {
                (deviceMotion, error) -> Void in
                        if(error == nil) {
                            self.handleDeviceMotionUpdate(deviceMotion: deviceMotion!)
                        } else {
                            //handle the error
                        }
                })
    }

    
    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion) {
        let attitude = deviceMotion.attitude
        let roll = degrees(radians: attitude.roll)
        let pitch = degrees(radians: attitude.pitch)
        let yaw = degrees(radians: attitude.yaw)
        print("Roll: \(roll)", "Pitch: \(pitch)", "Yaw: \(yaw)")
    }
    
    func degrees(radians:Double) -> Double {
        return 180 / Double.pi * radians
    }
}

