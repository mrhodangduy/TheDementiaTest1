//
//  JudgmentViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class JudgmentViewController: UIViewController {

    @IBOutlet var nextNavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    var previousPoint = 0
    var judgmentPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "JUDGMENT"
//        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_main"))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextNavi)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)


        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchAction(_ sender: UISwitchCustom) {
        if sender.isOn
        {
            judgmentPoint += 1
        }
        else
        {
            judgmentPoint -= 1
        }
    }
    
    
    @IBAction func Next(_ sender: Any) {
        let AbstractReasoningVC = storyboard?.instantiateViewController(withIdentifier: "AbstractReasoning") as! AbstractReasoningViewController
        
        AbstractReasoningVC.previousPoint = previousPoint  + judgmentPoint
        
        self.navigationController?.pushViewController(AbstractReasoningVC, animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

        
    }

    func NextScreen()
    {
        let AbstractReasoningVC = storyboard?.instantiateViewController(withIdentifier: "AbstractReasoning") as! AbstractReasoningViewController
        self.navigationController?.pushViewController(AbstractReasoningVC, animated: true)
    }

}
