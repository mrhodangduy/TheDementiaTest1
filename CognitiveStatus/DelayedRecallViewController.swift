//
//  DelayedRecallViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class DelayedRecallViewController: UIViewController {

    @IBOutlet var nextNavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    var previousPoint = 0
    var delayedPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DELAYED RECALL"

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextNavi)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)


        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchActions(_ sender: UISwitchCustom) {
        if sender.isOn
        {
            delayedPoint += 1
        }
        else
        {
            delayedPoint -= 1
        }
    }
    

    @IBAction func Next(_ sender: Any) {
        let JudgmentVC = storyboard?.instantiateViewController(withIdentifier: "Judgment") as! JudgmentViewController
        
        JudgmentVC.previousPoint = previousPoint + delayedPoint
        
        self.navigationController?.pushViewController(JudgmentVC, animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    func NextScreen()
    {
        let JudgmentVC = storyboard?.instantiateViewController(withIdentifier: "Judgment") as! JudgmentViewController
        self.navigationController?.pushViewController(JudgmentVC, animated: true)
    }

}
