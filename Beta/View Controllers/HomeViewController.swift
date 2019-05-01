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
    
    var saloes = [String]()
    var imagens = [UIImage(named: "barber")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonLayout(femininoButton)
        buttonLayout(masculinoButton)
        buttonLayout(unisexButton)
        
        determineMyCurrentLocation()
        
        getSaloon(pos: "-22.907919504027547,-43.059062289570065")
    }
    
    
    //MARK: - ButtonLayout
    func buttonLayout(_ botaoHome: UIButton!){
        
        botaoHome.layer.cornerRadius = 8
        botaoHome.clipsToBounds = true
    }
    
    //MARK: - Alamofire
    
    func getSaloon(pos latLong: String) -> Void {
        
        let urlString = "https://api.foursquare.com/v2/venues/explore?client_id=EPFA2ABVUS3R3BAQ0CHTFWIWKSDZCRXZTYAWTAAZ0WR5W53R&client_secret=RQNFWGTBO5ET5X3AJE5JY50A0LHFZ44VLP3YYZWJ1TUNUBJD&v=20180323&limit=10&ll=-22.907919504027547,-43.059062289570065&query=salao&radius=1000"
        
        Alamofire.request(urlString, method: .get).responseJSON {
            response in
            if response.result.isSuccess{
                let saloesJson: JSON = JSON(response.result.value!)
                self.updateSaloesJson(json: saloesJson)
            }
            else{
                print("ERROR \(String(describing: response.result.error))")
            }
        }
    }
    
    //MARK: - JSON Parsing
    func updateSaloesJson(json: JSON){
        
        let saloonJson = json["response"]["groups"][0]["items"]
        
        for item in 0..<saloonJson.count{
            
            let name: JSON = (json["response"]["groups"][0]["items"][item]["venue"]["name"])
            saloes.append(name.string!)
        }
        
        print(saloes)
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

