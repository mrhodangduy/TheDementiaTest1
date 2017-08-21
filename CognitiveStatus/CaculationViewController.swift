//
//  CaculationViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class CaculationViewController: UIViewController {
    
    @IBOutlet var nextNavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    var previousPoint = 0
    var CalculatorPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CALCULATION"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextNavi)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchActions(_ sender: UISwitchCustom) {
        if sender.isOn
        {
            CalculatorPoint += 1
        }
        else
        {
            CalculatorPoint -= 1
        }
    }
    
    
    @IBAction func Next(_ sender: Any) {
        let DelayedRecallVC = storyboard?.instantiateViewController(withIdentifier: "DelayedRecall") as! DelayedRecallViewController
        
        DelayedRecallVC.previousPoint  = previousPoint + CalculatorPoint
        
        self.navigationController?.pushViewController(DelayedRecallVC, animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    func NextScreen()
    {
        let DelayedRecallVC = storyboard?.instantiateViewController(withIdentifier: "DelayedRecall") as! DelayedRecallViewController
        self.navigationController?.pushViewController(DelayedRecallVC, animated: true)
    }
    
}
