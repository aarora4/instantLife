//
//  Person.swift
//  InstantLife
//
//  Created by Avi Arora on 2/19/18.
//  Copyright © 2018 Avi Arora. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var firstName:String
    var lastName:String
    var age:Int
    var gender:String
    var location:String
    var fatherName:String
    var motherName:String
    var fatherAge:Int
    var motherAge:Int
    var fatherOccupation:String
    var motherOccupation:String
    
    var salary:Int = 0
    var bankBalance:Int = 0
    var monthlyOutgoing:Int = 0
    var taxRate:Int = 0
    var netWorth:Int = 0
    
    var statHappiness:Float
    var statAppearance:Float
    var statFitness:Float
    var statIntelligence:Float
    var statSocial:Float
    
    var children:[Child] = []
    var houses:[House] = []
    var cars:[Car] = []
    
    
    init(firstName:String, lastName:String, age:Int, gender:String, location:String, fatherName:String, motherName:String, fatherAge:Int, motherAge:Int, fatherOccupation:String, motherOccupation:String, statHappiness:Float, statAppearance:Float, statFitness:Float, statIntelligence:Float, statSocial:Float)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
        self.location = location
        self.fatherName = fatherName
        self.motherName = motherName
        self.fatherAge = fatherAge
        self.motherAge = motherAge
        self.fatherOccupation = fatherOccupation
        self.motherOccupation = motherOccupation
        
        self.statHappiness = statHappiness
        self.statAppearance =  statAppearance
        self.statFitness = statFitness
        self.statIntelligence = statIntelligence
        self.statSocial = statSocial
    }
    init(coder aDecoder: NSCoder!)
    {
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        self.age = aDecoder.decodeObject(forKey: "age") as! Int
        self.gender = aDecoder.decodeObject(forKey: "gender") as! String
        self.location = aDecoder.decodeObject(forKey: "location") as! String
        self.fatherName = aDecoder.decodeObject(forKey: "fatherName") as! String
        self.motherName = aDecoder.decodeObject(forKey: "motherName") as! String
        self.fatherAge = aDecoder.decodeObject(forKey: "fatherAge") as! Int
        self.motherAge = aDecoder.decodeObject(forKey: "motherAge") as! Int
        self.fatherOccupation = aDecoder.decodeObject(forKey: "fatherOccupation") as! String
        self.motherOccupation = aDecoder.decodeObject(forKey: "motherOccupation") as! String
        
        self.statHappiness = aDecoder.decodeObject(forKey: "statHappiness") as! Float
        self.statAppearance =  aDecoder.decodeObject(forKey: "statAppearance") as! Float
        self.statFitness = aDecoder.decodeObject(forKey: "statFitness") as! Float
        self.statIntelligence = aDecoder.decodeObject(forKey: "statIntelligence") as! Float
        self.statSocial = aDecoder.decodeObject(forKey: "statSocial") as! Float
        
    }
    func initWithCoder(aDecoder: NSCoder) -> Person{
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        self.age = aDecoder.decodeObject(forKey: "age") as! Int
        self.gender = aDecoder.decodeObject(forKey: "gender") as! String
        self.location = aDecoder.decodeObject(forKey: "location") as! String
        self.fatherName = aDecoder.decodeObject(forKey: "fatherName") as! String
        self.motherName = aDecoder.decodeObject(forKey: "motherName") as! String
        self.fatherAge = aDecoder.decodeObject(forKey: "fatherAge") as! Int
        self.motherAge = aDecoder.decodeObject(forKey: "motherAge") as! Int
        self.fatherOccupation = aDecoder.decodeObject(forKey: "fatherOccupation") as! String
        self.motherOccupation = aDecoder.decodeObject(forKey: "motherOccupation") as! String
        
        self.statHappiness = aDecoder.decodeObject(forKey: "statHappiness") as! Float
        self.statAppearance =  aDecoder.decodeObject(forKey: "statAppearance") as! Float
        self.statFitness = aDecoder.decodeObject(forKey: "statFitness") as! Float
        self.statIntelligence = aDecoder.decodeObject(forKey: "statIntelligence") as! Float
        self.statSocial = aDecoder.decodeObject(forKey: "statSocial") as! Float
        return self
        
    }
    func encodeWithCoder(aCoder: NSCoder!){
        
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(age, forKey: "age")
        aCoder.encode(gender, forKey: "gender")
        aCoder.encode(location, forKey: "location")
        aCoder.encode(fatherName, forKey: "fatherName")
        aCoder.encode(motherName, forKey: "motherName")
        aCoder.encode(fatherAge, forKey: "fatherAge")
        aCoder.encode(motherAge, forKey: "motherAge")
        aCoder.encode(fatherOccupation, forKey: "fatherOccupation")
        aCoder.encode(motherOccupation, forKey: "motherOccupation")
        
        aCoder.encode(statHappiness, forKey: "statHappiness")
        aCoder.encode(statAppearance, forKey: "statAppearance")
        aCoder.encode(statFitness, forKey: "statFitness")
        aCoder.encode(statIntelligence, forKey: "statIntelligence")
        aCoder.encode(statSocial, forKey: "statSocial")
        
    }
    

}
