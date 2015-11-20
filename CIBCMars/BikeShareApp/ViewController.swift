//
//  ViewController.swift
//  BikeShareApp
//
//  Created by KBryan on 2015-11-19.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet var mapView: MKMapView!
    // create an endpoint
    var endpoint = NSURL(string: "http://www.bikesharetoronto.com/stations/json")
    // create a location manager
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.mapView.delegate = self
        
        self.locationManager.startUpdatingLocation()
        self.locationManager.requestWhenInUseAuthorization()
        let data = NSData(contentsOfURL: endpoint!)
        if let contentData = data {
            if let json = try? NSJSONSerialization.JSONObjectWithData(contentData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                print(json)
                let station = Station(json: json!)
                for pins in station.mapPins {
                    print(pins)
                    mapView.addAnnotation((pins as? MapPin)!)
                }
                
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

