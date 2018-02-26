//
//  Car.swift
//  InstantLife
//
//  Created by Avi Arora on 2/19/18.
//  Copyright © 2018 Avi Arora. All rights reserved.
//

import UIKit

class Car: NSObject {
    
    var cost:Int
    var electric:Bool
    var engine:String
    
     init(cost:Int, electric:Bool, engine:String) {
        self.cost = cost
        self.electric = electric
        self.engine = engine
    }
    
}
