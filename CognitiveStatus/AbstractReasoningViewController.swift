//
//  AbstractReasoningViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class AbstractReasoningViewController: UIViewController {
    
    @IBOutlet var backNavi: UIView!
    
    var previousPoint = 0
    var adstractResoningPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ABSTRACT REASONING"
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_main"))

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchActions(_ sender: UISwitchCustom) {
        if sender.isOn
        {
            adstractResoningPoint += 1
        }
        else
        {
            adstractResoningPoint -= 1
        }
    }
    
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func CaculatorScore(_ sender: Any) {
        let ScoreVC = storyboard?.instantiateViewController(withIdentifier: "Score") as! ScoreViewController
        
        ScoreVC.totalScore = previousPoint + adstractResoningPoint
        
        self.navigationController?.pushViewController(ScoreVC, animated: true)
    }
}
