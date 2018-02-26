//
//  House.swift
//  InstantLife
//
//  Created by Avi Arora on 2/19/18.
//  Copyright © 2018 Avi Arora. All rights reserved.
//

import UIKit

class House: NSObject {
    var cost:Int
    var bedrooms:Int
    var bathrooms:Int
    var garden:Bool
    var offStreetParking:Bool
    
    
     init(cost:Int, bedrooms:Int, bathrooms:Int, garden:Bool, offStreetParking:Bool) {
        self.cost = cost
        self.bathrooms = bathrooms
        self.bedrooms = bedrooms
        self.garden = garden
        self.offStreetParking = offStreetParking
    }
}
