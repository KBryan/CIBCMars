//
//  Station.swift
//  BikeShareApp
//
//  Created by KBryan on 2015-11-19.
//  Copyright © 2015 KBryan. All rights reserved.
//

import Foundation
import MapKit

struct Station {
    //
    var mapPins:NSMutableArray = []
    
    init(json:NSDictionary) {
        if let bikeShareStations = json["stationBeanList"] as? NSArray {
            
            let bikeShareDepots = bikeShareStations
            
            for var i = 0; i < bikeShareDepots.count; i++ {
                var availableBike:Int?
                var availableDocks:Int?
                var latitude:Float?
                var longitude:Float?
                var stationName:String?
                let bikeShareData = bikeShareDepots[i] as? NSDictionary
                
                if let bikeShare = bikeShareData {
                    
                    if let bike = bikeShare["availableBikes"] as? Int {
                        availableBike = bike as Int
                    }
                    if let dock = bikeShare["availableDocks"] as? Int {
                        availableDocks = dock as Int
                    }
                    if let lat = bikeShare["latitude"] as? Float {
                        latitude = lat as Float
                    }
                    if let long = bikeShare["longitude"] as? Float {
                        longitude = long
                    }
                    if let station = bikeShare["stationName"] as? String {
                        stationName = station
                    }
                    let pin = MapPin(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees( latitude!), longitude: CLLocationDegrees(longitude!)), title: stationName!, subTitle: "Hello")
                    mapPins.addObject(pin)
                }
            }
        }
    }
}
