//
//  AttentionViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class AttentionViewController: UIViewController {
    @IBOutlet var nextNavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    //Switch
    
    @IBOutlet weak var sw1: UISwitchCustom!
    @IBOutlet weak var sw2: UISwitchCustom!
    @IBOutlet weak var sw3: UISwitchCustom!
    @IBOutlet weak var sw4: UISwitchCustom!
    @IBOutlet weak var sw5: UISwitchCustom!
    @IBOutlet weak var sw6: UISwitchCustom!
    @IBOutlet weak var sw7: UISwitchCustom!
    
    var previewPoint:Int = 0
    var attentionPoint = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ATTENTION"

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextNavi)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchActions(_ sender: UISwitchCustom) {
        if sender.isOn
        {
            attentionPoint += 1
            
        }
        else
        {
            attentionPoint -= 1
        }
    }
    
    
    @IBAction func Next(_ sender: Any) {
        let ImmediateRecallVC = storyboard?.instantiateViewController(withIdentifier: "ImmediateRecall") as! ImmediateRecallViewController
        
        ImmediateRecallVC.previewPoint  = previewPoint + attentionPoint
        
        self.navigationController?.pushViewController(ImmediateRecallVC, animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    
    
}
