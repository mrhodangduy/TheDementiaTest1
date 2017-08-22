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
    
    
    var score = 0
    var name:String?
    var dateOfBirth:String?
    var levelOfEducation:String?
    var ethnicity:String?
    var age: Int?
    var work:String?
    var isPersonAlert:Bool?
    var sex:Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)
        
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
    
    @IBAction func ShareAction(_ sender: UIBarButtonItem) {
        
        let nameShare = "Name: \(name!)"
        let date =      "Date of Birth: \(dateOfBirth!)"
        let edu =       "Level of Education: \(levelOfEducation!)"
        let ethnic =    "Ethnicity: \(ethnicity!)"
        let ageShare =  "Age: \(age!)"
        let workShare = "Work: \(work!)"
        let scoreshare =     "Score: \(score)"
        let result =    "Result: \(tv_Status.text!)"
        let sexShare:String
        let alert:String
        
        if sex!
        {
            sexShare =  "Sex: Male"
        }
        else
        {
            sexShare =  "Sex: Female"
            
        }
        
        if isPersonAlert!
        {
            alert  =    "Is Person Alert?: Yes"
        }
        else
        {
            alert  =    "Is Person Alert?: No"
            
        }
        
        let shareContent = [nameShare,alert,date,edu,sexShare,ethnic,ageShare,workShare,scoreshare,result]
        
        let controller = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        
        // check device: phone or pad
        
        if UI_USER_INTERFACE_IDIOM() == .phone {
            
            present(controller, animated: true, completion: nil)
            
        }
        else
        {
            controller.popoverPresentationController?.sourceView = self.view
            controller.popoverPresentationController?.barButtonItem = sender
            controller.popoverPresentationController?.permittedArrowDirections = .up
            present(controller, animated: true, completion: nil)
            
        }

        
    }
    
}
