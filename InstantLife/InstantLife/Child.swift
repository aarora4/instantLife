//
//  Child.swift
//  InstantLife
//
//  Created by Avi Arora on 2/19/18.
//  Copyright © 2018 Avi Arora. All rights reserved.
//

import UIKit

class Child: NSObject {
    
    var firstName:String
    var lastName:String
    var parentName:String
    var age:Int
    var occupation:String = ""
    var salary:Int = 0
    
    init(firstName:String, lastName:String, parentName:String, age:Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.parentName = parentName
        self.age = age
    }
    
}
