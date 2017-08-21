//
//  OrientationViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class OrientationViewController: UIViewController {

    @IBOutlet var nextnavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    //Switch
    
    @IBOutlet weak var sw1: UISwitchCustom!
    @IBOutlet weak var sw2: UISwitchCustom!
    @IBOutlet weak var sw3: UISwitchCustom!
    @IBOutlet weak var sw4: UISwitchCustom!
    @IBOutlet weak var sw5: UISwitchCustom!
    
    
    //declared scorePoint
    
    var orientationPoint = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "ORIENTATION"


        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextnavi)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchActions(_ sender: UISwitchCustom) {
        
        if sender.isOn
        {
            orientationPoint += 1
        }
        else
        {
            orientationPoint -= 1
        }
    }
    
    
    
    @IBAction func Next(_ sender: Any) {
        let AttetionVC = storyboard?.instantiateViewController(withIdentifier: "Attention") as! AttentionViewController
        
        
        AttetionVC.previewPoint = orientationPoint
        
        self.navigationController?.pushViewController(AttetionVC, animated: true)
        
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
