//
//  UserViewController.swift
//  InstantLife
//
//  Created by Avi Arora on 2/19/18.
//  Copyright © 2018 Avi Arora. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var stats:[Float] = []
    var finances:[Int] = []
    @IBOutlet var socialProgress: UIProgressView!
    @IBOutlet var intelligenceProgress: UIProgressView!
    @IBOutlet var fitnessProgress: UIProgressView!
    @IBOutlet var appearanceProgress: UIProgressView!
    @IBOutlet var happinessProgress: UIProgressView!
    @IBAction func showFinance(_ sender: Any) {
        financeView.isHidden = false
        statsView.isHidden = true
        salaryLabel.text = String(finances[0])
        bankBalanceLabel.text = String(finances[1])
        monthlyOutgoingsLabel.text = String(finances[2])
        taxRateLabel.text = String(finances[3])
        netWorthLabel.text = String(finances[4])
    }
    @IBAction func showStats(_ sender: Any) {
        financeView.isHidden = true
        statsView.isHidden = false
    }
    @IBOutlet var financeButton: UIButton!
    @IBOutlet var statsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        financeView.isHidden = true
        statsView.isHidden = false
        print(stats)
        happinessProgress.progress = stats[0]
        appearanceProgress.progress = stats[1]
        fitnessProgress.progress = stats[2]
        intelligenceProgress.progress = stats[3]
        socialProgress.progress = stats[4]
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var financeView: UIView!
    
    @IBOutlet var statsView: UIView!
    @IBOutlet var netWorthLabel: UILabel!
    @IBOutlet var taxRateLabel: UILabel!
    @IBOutlet var monthlyOutgoingsLabel: UILabel!
    @IBOutlet var bankBalanceLabel: UILabel!
    @IBOutlet var salaryLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

