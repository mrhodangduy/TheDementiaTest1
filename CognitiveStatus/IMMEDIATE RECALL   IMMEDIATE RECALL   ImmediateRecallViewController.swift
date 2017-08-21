//
//  IMMEDIATE RECALL   IMMEDIATE RECALL   ImmediateRecallViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class ImmediateRecallViewController: UIViewController {

    @IBOutlet var nextnavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    var previewPoint:Int = 0
    var ImmediaPoint = 0
    
    // SWitch
    
    @IBOutlet weak var sw1: UISwitchCustom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "IMMEDIATE RECALL"

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextnavi)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)


        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchAction(_ sender: UISwitchCustom) {
        
        if sender.isOn
        {
            ImmediaPoint += 1
        }
        else
        {
            ImmediaPoint -= 1
        }
    }
    
    
    @IBAction func Next(_ sender: Any) {
        let LanguageVC = storyboard?.instantiateViewController(withIdentifier: "Language") as! LanguageViewController
        
        LanguageVC.previousPoint = previewPoint + ImmediaPoint
        
        self.navigationController?.pushViewController(LanguageVC, animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }

    func NextScreen()
    {
        let LanguageVC = storyboard?.instantiateViewController(withIdentifier: "Language") as! LanguageViewController
        self.navigationController?.pushViewController(LanguageVC, animated: true)
    }

}
