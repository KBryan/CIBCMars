//
//  MapPin.swift
//  BikeShareApp
//
//  Created by KBryan on 2015-11-19.
//  Copyright © 2015 KBryan. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapPin: NSObject, MKAnnotation {
    
    var coordinate:CLLocationCoordinate2D
    var title:String?
    var subtitle:String?
 
    init(coordinate:CLLocationCoordinate2D,title:String,subTitle:String) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subTitle

    }
}
