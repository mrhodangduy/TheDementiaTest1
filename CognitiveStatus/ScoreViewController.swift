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
    
    //define Status
    
    let lessthan15 = "Serious Cognitive Impairment of  Possible Organic origin, additional testing is strongly encouraged.  Person likely is experiencing a dementia like disorder or another neurological concern."
    
    let between1520 = "Moderate Cognitive Impairment, additional testing is strongly encouraged.  This person may have a dementia disorder or another neurological or psychological concern."
    
    let between2025 = "Person is diminished but functional, additional testing is likely warranted."
    
    let over26 = "No Impairment Noted, Person is within normal cognitive limits;  Additional testing may be of use to detect subtle deficits, if any."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SCORE"
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_main"))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backNavi)
        
        
        lblTotalScore.text = "\(totalScore)/30"
        setStatusForScore()
        
        print(UserDefaults.standard.object(forKey: "name")!)
        print(UserDefaults.standard.object(forKey: "dateOfBirth")!)
        print(UserDefaults.standard.object(forKey: "ethinicity")!)
        print(UserDefaults.standard.object(forKey: "education")!)
        print(UserDefaults.standard.object(forKey: "age")!)
        print(UserDefaults.standard.object(forKey: "work")!)
        print(UserDefaults.standard.object(forKey: "personAlert")!)
        print(UserDefaults.standard.object(forKey: "sex")!)
        print(totalScore)
        
        
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
        
    }
    @IBAction func EmailData(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "birthday")
        
        let name = standard.object(forKey: "name") as? String
        let dateOfBirth = standard.object(forKey: "dateOfBirth") as? String
        let personAlert = standard.object(forKey: "personAlert") as? Bool
        let education = standard.object(forKey: "education") as? String
        let ethinicity = standard.object(forKey: "ethinicity") as? String
        let age = standard.object(forKey: "age") as? Int
        let sex = standard.object(forKey: "sex") as? Bool
        let work = standard.object(forKey: "work") as? String
        
//        saveToCoreData(name: name!, isPersonAlert: personAlert!, dateOfBirth: dateOfBirth!, eduacation: education!, sex: sex!, ethnicity: ethinicity!, age: age!, work: work!, score: totalScore)
        
        
//        if MFMailComposeViewController.canSendMail()
//        {
//            let mail = MFMailComposeViewController()
//            mail.mailComposeDelegate = self
//            mail.setSubject("Patient Score")
//            mail.setMessageBody("", isHTML: false)
//            
//            present(mail, animated: true, completion: nil)
//        }
//        else
//        {
//            print("Could not open mail compose. Plese check your mail configure")
//        }
        
        let vc = UIActivityViewController(activityItems: [name!,work!], applicationActivities: [])
        present(vc, animated: true, completion: nil)
        
    }
    
    
}

extension ScoreViewController: MFMailComposeViewControllerDelegate
{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}







