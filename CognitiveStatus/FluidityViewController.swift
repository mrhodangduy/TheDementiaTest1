//
//  FluidityViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class FluidityViewController: UIViewController {
    
    @IBOutlet var nextnavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    // declared switch
    
    @IBOutlet weak var sw_04Animal: UISwitchCustom!
    @IBOutlet weak var sw_59Animal: UISwitchCustom!
    @IBOutlet weak var sw_1015Animal: UISwitchCustom!
    
    
    //
    
    var previousPoint = 0
    var FluidityPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FLUIDITY"
//        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_main"))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextnavi)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)        
        // Do any additional setup after loading the view.
    }
    // Config Switch
    
    @IBAction func SW_1(_ sender: Any) {
        
        if sw_04Animal.isOn
        {
            FluidityPoint = 0
            sw_59Animal.isOn = false
            sw_1015Animal.isOn = false

        }
    }
    
    @IBAction func SW_2(_ sender: Any) {
        if sw_59Animal.isOn
        {
            
            FluidityPoint = 1
            sw_1015Animal.isOn = false
            sw_04Animal.isOn = false

        }
        
    }
    
    @IBAction func SW_3(_ sender: Any) {
        if sw_1015Animal.isOn
        {
            FluidityPoint = 2
            sw_04Animal.isOn = false
            sw_59Animal.isOn = false
        }
    }
    
        
    @IBOutlet weak var Next: UIButton!
    @IBAction func Next(_ sender: Any) {
        let CaculationVC = storyboard?.instantiateViewController(withIdentifier: "Caculation") as! CaculationViewController
        
        CaculationVC.previousPoint = previousPoint + FluidityPoint
        
        self.navigationController?.pushViewController(CaculationVC, animated: true)
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    func NextScreen()
    {
        let CaculationVC = storyboard?.instantiateViewController(withIdentifier: "Caculation") as! CaculationViewController
        self.navigationController?.pushViewController(CaculationVC, animated: true)
    }
    
}
