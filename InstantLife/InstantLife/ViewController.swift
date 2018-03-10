//
//  ViewController.swift
//  InstantLife
//
//  Created by Avi Arora on 2/19/18.
//  Copyright © 2018 Avi Arora. All rights reserved.
//

import UIKit
import Fakery

class ViewController: UIViewController {
    var person:Person = Person(firstName: "Gil", lastName: "Gilbert", age: 0, gender: "Male", location: "US", fatherName: "Gale Gilbert", motherName: "Gail Gilbert", fatherAge: 25, motherAge: 27, fatherOccupation: "Job", motherOccupation: "Job", statHappiness: 0.1, statAppearance: 0.1, statFitness: 0.1, statIntelligence: 0.1, statSocial: 0.1)
    var faker = Faker(locale: "en")
    var textFieldText:String = ""
    var userDefaults = UserDefaults.standard
    
    @IBOutlet var mainTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let hasLaunchedKey = "HasLaunched"
        let defaults = UserDefaults.standard
        var hasLaunched = defaults.bool(forKey: hasLaunchedKey)
        
        if !hasLaunched {
            makePerson()
            defaults.set(true, forKey: hasLaunchedKey)
            defaults.set("", forKey: "textFieldText")
            updateTextView(message: "You were born a " + person.gender + " in " + person.location)
            textViewEmptyLine()
            updateTextView(message: "You're name is " + person.firstName + " " + person.lastName)
            textViewEmptyLine()
            updateTextView(message: "You're father is " + person.fatherName + ", Age " + String(person.fatherAge))
            updateTextView(message: "You're mother is " + person.motherName + ", Age " + String(person.motherAge))
            
        }
        else
        {
            print("1")
            constructPerson()
            textFieldText = userDefaults.value(forKey: "textFieldText") as! String
            
            if mainTextView == nil {
                print("maintextview is nil")
            }
            if textFieldText == nil {
                print("textFieldText")
            }
            mainTextView.text = textFieldText
            highlightCurrentAge()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var ageButton: UIButton!

    func updateTextView(message:String)
    {
        
        textFieldText = userDefaults.value(forKey: "textFieldText") as! String
        
        textFieldText = textFieldText + "\n" + message
        userDefaults.set(textFieldText, forKey: "textFieldText")
        mainTextView.text = textFieldText
        
        
        
    }
    func updateTextViewAge(message:String)
    {
        textViewEmptyLine()
        textFieldText = userDefaults.value(forKey: "textFieldText") as! String
        textFieldText = textFieldText + "\n" + message
        let string_to_color = message
        
        let range = (textFieldText as NSString).range(of: string_to_color)
        
        let attribute = NSMutableAttributedString.init(string: textFieldText)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red , range: range)
        userDefaults.set(textFieldText, forKey: "textFieldText")
        mainTextView.attributedText = attribute
        
        
        
    }
    func highlightCurrentAge()
    {
        textFieldText = userDefaults.value(forKey: "textFieldText") as! String
        let string_to_color = String(person.age) + " Years Old"
        let range = (textFieldText as NSString).range(of: string_to_color)
        
        let attribute = NSMutableAttributedString.init(string: textFieldText)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red , range: range)
        userDefaults.set(textFieldText, forKey: "textFieldText")
        mainTextView.attributedText = attribute
        
    }
    func textViewEmptyLine()
    {
        textFieldText = userDefaults.value(forKey: "textFieldText") as! String
        textFieldText = textFieldText + "\n"
        userDefaults.set(textFieldText, forKey: "textFieldText")
        mainTextView.text = textFieldText
    }
    func sendStats() -> [Float]
    {
        
        return [person.statHappiness, person.statAppearance, person.statFitness, person.statIntelligence, person.statSocial]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        savePerson()
        
        if let vc = segue.destination as? UserViewController
        {
            vc.stats = [person.statHappiness, person.statAppearance, person.statFitness, person.statIntelligence, person.statSocial]
            vc.finances = [person.salary, person.bankBalance, person.monthlyOutgoing, person.taxRate, person.netWorth]
        }
    }
    func makePerson()
    {
        let lastName = faker.name.lastName()
        let fatherAge = Int(arc4random_uniform(40)) + 18
        var rand = arc4random_uniform(2)
        var motherAge = 0
        var gender = "Male"
        if rand == 0{
            motherAge = fatherAge + Int(arc4random_uniform(4))
            gender = "Male"
        }
        else{
            motherAge = fatherAge - Int(arc4random_uniform(4))
            gender = "Female"
        }
        person = Person(firstName: faker.name.firstName(), lastName: lastName, age: 0, gender: gender, location: faker.address.country(), fatherName: faker.name.firstName() + " " + lastName, motherName: faker.name.firstName() + " " + lastName, fatherAge: fatherAge, motherAge: motherAge, fatherOccupation: "Job Holder", motherOccupation: "Job Holder", statHappiness: Float(arc4random()) / 0xFFFFFFFF, statAppearance: Float(arc4random()) / 0xFFFFFFFF, statFitness: Float(arc4random()) / 0xFFFFFFFF, statIntelligence: Float(arc4random()) / 0xFFFFFFFF, statSocial: Float(arc4random()) / 0xFFFFFFFF)
        
        let encodedFirstName = NSKeyedArchiver.archivedData(withRootObject: person.firstName)
        let encodedLastName = NSKeyedArchiver.archivedData(withRootObject: person.lastName)
        let encodedAge = NSKeyedArchiver.archivedData(withRootObject: person.age)
        let encodedGender = NSKeyedArchiver.archivedData(withRootObject: person.gender)
        let encodedLocation = NSKeyedArchiver.archivedData(withRootObject: person.location)
        let encodedFatherName = NSKeyedArchiver.archivedData(withRootObject: person.fatherName)
        let encodedMotherName = NSKeyedArchiver.archivedData(withRootObject: person.motherName)
        let encodedFatherAge = NSKeyedArchiver.archivedData(withRootObject: person.fatherAge)
        let encodedMotherAge = NSKeyedArchiver.archivedData(withRootObject: person.motherAge)
        let encodedFatherOccupation = NSKeyedArchiver.archivedData(withRootObject: person.fatherOccupation)
        let encodedMotherOccupation = NSKeyedArchiver.archivedData(withRootObject: person.motherOccupation)
        let encodedStatHappiness = NSKeyedArchiver.archivedData(withRootObject: person.statHappiness)
        let encodedStatAppearance = NSKeyedArchiver.archivedData(withRootObject: person.statAppearance)
        let encodedStatFitness = NSKeyedArchiver.archivedData(withRootObject: person.statFitness)
        let encodedStatIntelligence = NSKeyedArchiver.archivedData(withRootObject: person.statIntelligence)
        let encodedStatSocial = NSKeyedArchiver.archivedData(withRootObject: person.statSocial)
        
        let encodedArray: [NSData] = [encodedFirstName as NSData, encodedLastName as NSData, encodedAge as NSData, encodedGender as NSData, encodedLocation as NSData, encodedFatherName as NSData, encodedMotherName as NSData, encodedFatherAge as NSData, encodedMotherAge as NSData, encodedFatherOccupation as NSData, encodedMotherOccupation as NSData, encodedStatHappiness as NSData, encodedStatAppearance as NSData, encodedStatFitness as NSData, encodedStatIntelligence as NSData, encodedStatSocial as NSData]
        
        
        userDefaults.set(encodedArray, forKey: "person")
        userDefaults.synchronize()
        
    }
    func constructPerson()
    {
        
        var personDataEncoded: [NSData] = userDefaults.object(forKey: "person") as! [NSData]
        
        let unpackedFirstName: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[0] as Data) as! String
        let unpackedLastName: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[1] as Data) as! String
        let unpackedAge: Int = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[2] as Data) as! Int
        let unpackedGender: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[3] as Data) as! String
        let unpackedLocation: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[4] as Data) as! String
        let unpackedFatherName: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[5] as Data) as! String
        let unpackedMotherName: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[6] as Data) as! String
        let unpackedFatherAge: Int = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[7] as Data) as! Int
        let unpackedMotherAge: Int = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[8] as Data) as! Int
        let unpackedFatherOccupation: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[9] as Data) as! String
        let unpackedMotherOccupation: String = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[10] as Data) as! String
        let unpackedStatHappiness: Float = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[11] as Data) as! Float
        let unpackedStatAppearance: Float = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[12] as Data) as! Float
        let unpackedStatFitness: Float = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[13] as Data) as! Float
        let unpackedStatIntelligence: Float = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[14] as Data) as! Float
        let unpackedStatSocial: Float = NSKeyedUnarchiver.unarchiveObject(with: personDataEncoded[15] as Data) as! Float
        
        person = Person(firstName: unpackedFirstName, lastName: unpackedLastName, age: unpackedAge, gender: unpackedGender, location: unpackedLocation, fatherName: unpackedFatherName, motherName: unpackedMotherName, fatherAge: unpackedFatherAge, motherAge: unpackedMotherAge, fatherOccupation: unpackedFatherOccupation, motherOccupation: unpackedMotherOccupation, statHappiness: unpackedStatHappiness, statAppearance: unpackedStatAppearance, statFitness: unpackedStatFitness, statIntelligence: unpackedStatIntelligence, statSocial: unpackedStatSocial)
    }
    func savePerson()
    {
        let encodedFirstName = NSKeyedArchiver.archivedData(withRootObject: person.firstName)
        let encodedLastName = NSKeyedArchiver.archivedData(withRootObject: person.lastName)
        let encodedAge = NSKeyedArchiver.archivedData(withRootObject: person.age)
        let encodedGender = NSKeyedArchiver.archivedData(withRootObject: person.gender)
        let encodedLocation = NSKeyedArchiver.archivedData(withRootObject: person.location)
        let encodedFatherName = NSKeyedArchiver.archivedData(withRootObject: person.fatherName)
        let encodedMotherName = NSKeyedArchiver.archivedData(withRootObject: person.motherName)
        let encodedFatherAge = NSKeyedArchiver.archivedData(withRootObject: person.fatherAge)
        let encodedMotherAge = NSKeyedArchiver.archivedData(withRootObject: person.motherAge)
        let encodedFatherOccupation = NSKeyedArchiver.archivedData(withRootObject: person.fatherOccupation)
        let encodedMotherOccupation = NSKeyedArchiver.archivedData(withRootObject: person.motherOccupation)
        let encodedStatHappiness = NSKeyedArchiver.archivedData(withRootObject: person.statHappiness)
        let encodedStatAppearance = NSKeyedArchiver.archivedData(withRootObject: person.statAppearance)
        let encodedStatFitness = NSKeyedArchiver.archivedData(withRootObject: person.statFitness)
        let encodedStatIntelligence = NSKeyedArchiver.archivedData(withRootObject: person.statIntelligence)
        let encodedStatSocial = NSKeyedArchiver.archivedData(withRootObject: person.statSocial)
        
        let encodedArray: [NSData] = [encodedFirstName as NSData, encodedLastName as NSData, encodedAge as NSData, encodedGender as NSData, encodedLocation as NSData, encodedFatherName as NSData, encodedMotherName as NSData, encodedFatherAge as NSData, encodedMotherAge as NSData, encodedFatherOccupation as NSData, encodedMotherOccupation as NSData, encodedStatHappiness as NSData, encodedStatAppearance as NSData, encodedStatFitness as NSData, encodedStatIntelligence as NSData, encodedStatSocial as NSData]
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedArray, forKey: "person")
        userDefaults.synchronize()
    }
    
    @IBAction func age(_ sender: Any) {
        person.age = person.age + 1
        let string = String(person.age) + " Years Old"
        
        updateTextViewAge(message: string)
        if person.age == 5
        {
            textViewEmptyLine()
            updateTextView(message: "I started school")
            highlightCurrentAge()
            
        }
        
        
    
    }
    func die()
    {
        let hasLaunchedKey = "HasLaunched"
        userDefaults.set(false, forKey: hasLaunchedKey)
        userDefaults.set("", forKey: "textFieldText")
        mainTextView.text = textFieldText
        
    }
}

