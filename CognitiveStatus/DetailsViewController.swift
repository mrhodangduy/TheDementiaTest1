//
//  DetailsViewController.swift
//  TheDementiaTest
//
//  Created by QTS Coder on 8/21/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {
    
    @IBOutlet var backNavi: UIView!
    @IBOutlet weak var lblisPersonAlert: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblEducation: UILabel!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var lblEthnicity: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblWork: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var tv_Status: UITextView!
    
    
    var userDetail = NSManagedObject()
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)
        
        let name = userDetail.value(forKey: "name") as? String
        let isPersonAlert = userDetail.value(forKey: "isPersonAlert") as? Bool
        let dateOfBirth = userDetail.value(forKey: "dateOfBirth") as? String
        let levelOfEducation = userDetail.value(forKey: "levelOfEducation") as? String
        let sex = userDetail.value(forKey: "sex") as? Bool
        let ethnicity = userDetail.value(forKey: "ethnicity") as? String
        let age = userDetail.value(forKey: "age") as? Int
        let work = userDetail.value(forKey: "work") as? String
        score = (userDetail.value(forKey: "score") as? Int)!

        
        self.navigationItem.title = name!
        lblDateOfBirth.text = dateOfBirth!
        lblEducation.text = levelOfEducation!
        lblEthnicity.text = ethnicity!
        lblAge.text = String(age!)
        lblWork.text = work!
        lblScore.text = String(score)
        
        if isPersonAlert!
        {
            lblisPersonAlert.text = "Yes"
        }
        else
        {
            lblisPersonAlert.text = "No"
        }
        if sex!
        {
            lblSex.text = "Male"
        }
        else
        {
            lblSex.text = "Female"
        }
        
        setStatusForScore()
        
        // Do any additional setup after loading the view.
    }
    
    func setStatusForScore()
    {
        if score < 15
        {
            tv_Status.text = StatusConstrant.lessthan15
        }
        else if score < 21
        {
            tv_Status.text = StatusConstrant.between1520
        }
        else if score < 27
        {
            tv_Status.text = StatusConstrant.between2025
        } else
        {
            tv_Status.text = StatusConstrant.over26
        }
        
    }
    
    func configlabel()
    {
        lblSex.adjustsFontSizeToFitWidth = true
        lblisPersonAlert.adjustsFontSizeToFitWidth = true
        lblScore.adjustsFontSizeToFitWidth = true
        lblWork.adjustsFontSizeToFitWidth = true
        lblAge.adjustsFontSizeToFitWidth = true
        lblEthnicity.adjustsFontSizeToFitWidth = true
        lblEducation.adjustsFontSizeToFitWidth = true
        lblDateOfBirth.adjustsFontSizeToFitWidth = true
        
    
    }
    
    @IBAction func Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
