//
//  ScoreViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class ScoreViewController: UIViewController {

    @IBOutlet var backNavi: UIView!
    
    @IBOutlet weak var tv_Status: UITextView!
    @IBOutlet weak var lblTotalScore: UILabel!
    
    var totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "SCORE"
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_main"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)
        
        lblTotalScore.text = "\(totalScore)/30"
        setStatusForScore()
        
    }
    
    func setStatusForScore()
    {
        if totalScore < 15
        {
            tv_Status.text = StatusConstrant.lessthan15
        }
        else if totalScore < 21
        {
            tv_Status.text = StatusConstrant.between1520
        }
        else if totalScore < 27
        {
            tv_Status.text = StatusConstrant.between2025
        } else
        {
            tv_Status.text = StatusConstrant.over26
        }

    }

    @IBAction func Back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SaveData(_ sender: UIButton) {
      
        let name = standard.object(forKey: "name") as? String
        let dateOfBirth = standard.object(forKey: "dateOfBirth") as? String
        let personAlert = standard.object(forKey: "personAlert") as? Bool
        let education = standard.object(forKey: "education") as? String
        let ethinicity = standard.object(forKey: "ethinicity") as? String
        let age = standard.object(forKey: "age") as? Int
        let sex = standard.object(forKey: "sex") as? Bool
        let work = standard.object(forKey: "work") as? String
        
        saveToCoreData(name: name!, isPersonAlert: personAlert!, dateOfBirth: dateOfBirth!, eduacation: education!, sex: sex!, ethnicity: ethinicity!, age: age!, work: work!, score: totalScore)
        
        standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        standard.synchronize()
        
        self.performSegue(withIdentifier: "gotoHome", sender: nil)
        
    }
    
    @IBAction func EmailData(_ sender: UIButton) {
        
        let name = standard.object(forKey: "name") as! String
        let dateOfBirth = standard.object(forKey: "dateOfBirth") as! String
        let personAlert = standard.object(forKey: "personAlert") as! Bool
        let education = standard.object(forKey: "education") as! String
        let ethinicity = standard.object(forKey: "ethinicity") as! String
        let age = standard.object(forKey: "age") as! Int
        let sex = standard.object(forKey: "sex") as! Bool
        let work = standard.object(forKey: "work") as! String
        
        let nameShare = "Name: \(name)"
        let date =      "Date of Birth: \(dateOfBirth)"
        let edu =       "Level of Education: \(education)"
        let ethnic =    "Ethnicity: \(ethinicity)"
        let ageShare =  "Age: \(age)"
        let workShare = "Work: \(work)"
        let score =     "Score: \(totalScore)"
        let result =    "Result: \(tv_Status.text!)"
        let sexShare:String
        let alert:String
        
        if sex
        {
            sexShare =  "Sex: Male"
        }
        else
        {
            sexShare =  "Sex: Female"

        }
        
        if personAlert
        {
            alert  =    "Is Person Alert?: Yes"
        }
        else
        {
            alert  =    "Is Person Alert?: No"

        }
        
        let shareContent = [nameShare,alert,date,edu,sexShare,ethnic,ageShare,workShare,score,result]
        
        let controller = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        
        // check device: phone or pad
        
        if UI_USER_INTERFACE_IDIOM() == .phone {
            
            present(controller, animated: true, completion: nil)
            
        }
        else
        {
            controller.popoverPresentationController?.sourceView = sender
            controller.popoverPresentationController?.sourceRect =  sender.bounds
            controller.popoverPresentationController?.permittedArrowDirections = .down
            present(controller, animated: true, completion: nil)

        }
        
    }
    
    
}








