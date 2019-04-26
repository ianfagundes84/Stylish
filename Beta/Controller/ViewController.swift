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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locationManager:CLLocationManager!
    
    let saloes = [("Salao Teste")]
    let imagens = [UIImage(named: "barber")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        determineMyCurrentLocation()
        
        getSaloon(pos: "-22.907919504027547,-43.059062289570065")
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
                print("ERROR \(response.result.error)")
            }
        }
    }
    
    //MARK: - JSON Parsing
    func updateSaloesJson(json: JSON){
        let saloonNameJson = json["response"]["groups"][0]["items"][0]["venue"]["name"]
        print(saloonNameJson)
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
    
    //MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saloes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.label.text = self.saloes[indexPath .row]
        cell.photo.image = self.imagens[indexPath.row]
        
        return cell
    }
    
}

