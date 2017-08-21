//
//  LanguageViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet var nextNavi: UIView!
    @IBOutlet var backNavi: UIView!
    
    // Switch
    
    
    var previousPoint:Int = 0
    var LanguagePoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "LANGUAGE"

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextNavi)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)


        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchActions(_ sender: UISwitchCustom) {
        
        if sender.isOn
        {
            LanguagePoint += 1
        }
        else
        {
            LanguagePoint -= 1

        }
    }
    
    @IBAction func Next(_ sender: Any) {
        let FluidityVC = storyboard?.instantiateViewController(withIdentifier: "Fluidity") as! FluidityViewController
        
        FluidityVC.previousPoint = LanguagePoint + previousPoint
        
        self.navigationController?.pushViewController(FluidityVC, animated: true)
    }

    @IBOutlet weak var Back: UIButton!
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    func NextScreen()
    {
        let FluidityVC = storyboard?.instantiateViewController(withIdentifier: "Fluidity") as! FluidityViewController
        self.navigationController?.pushViewController(FluidityVC, animated: true)
    }

}
