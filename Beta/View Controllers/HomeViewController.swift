//
//  ViewController.swift
//  Beta
//
//  Created by Ian Fagundes on 23/04/19.
//  Copyright © 2019 Ian Fagundes. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var femininoButton: UIButton!
    @IBOutlet weak var masculinoButton: UIButton!
    @IBOutlet weak var unisexButton: UIButton!
    
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonLayout(femininoButton)
        buttonLayout(masculinoButton)
        buttonLayout(unisexButton)
        
        determineMyCurrentLocation()
    }
    
    //MARK: - ButtonLayout
    func buttonLayout(_ botaoHome: UIButton!){
        
        botaoHome.layer.cornerRadius = 8
        botaoHome.clipsToBounds = true
    }
    
    //MARK: - GPS Manager
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        manager.stopUpdatingLocation()
        locationManager.delegate = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}

