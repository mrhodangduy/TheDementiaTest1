//
//  SaveCoreData.swift
//  TheDementiaTest
//
//  Created by QTS Coder on 8/21/17.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension UIViewController
    
{
    func saveToCoreData(name:String, isPersonAlert:Bool, dateOfBirth: String, eduacation:String, sex: Bool, ethnicity: String, age: Int, work: String, score: Int)
    {
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return }
        
        if #available(iOS 10.0, *) {
            
            let content = appDel.persistentContainer.viewContext
            guard let entity = NSEntityDescription.entity(forEntityName: "Users", in: content) else { return }
            let user = NSManagedObject(entity: entity, insertInto: content)
            
            user.setValue(name, forKey: "name")
            user.setValue(isPersonAlert, forKey: "isPersonAlert")
            user.setValue(dateOfBirth, forKey: "dateOfBirth")
            user.setValue(eduacation, forKey: "levelOfEducation")
            user.setValue(sex, forKey: "sex")
            user.setValue(ethnicity, forKey: "ethnicity")
            user.setValue(age, forKey: "age")
            user.setValue(work, forKey: "work")
            user.setValue(score, forKey: "score")
            
            do {
                try content.save()
                print("Save successful")
                
            } catch let error as NSError {
                
                print(error.localizedDescription)
            }
        }
        else
        {
            let content = appDel.managedObjectContext
            let entity = NSEntityDescription.entity(forEntityName: "Users", in: content)
            let user = NSManagedObject(entity: entity!, insertInto: content)
            
            user.setValue(name, forKey: "name")
            user.setValue(isPersonAlert, forKey: "isPersonAlert")
            user.setValue(dateOfBirth, forKey: "dateOfBirth")
            user.setValue(eduacation, forKey: "levelOfEducation")
            user.setValue(sex, forKey: "sex")
            user.setValue(ethnicity, forKey: "ethnicity")
            user.setValue(age, forKey: "age")
            user.setValue(work, forKey: "work")
            user.setValue(score, forKey: "score")
            
            do {
                try content.save()
                print("Save successful")
                
            } catch let error as NSError {
                
                print(error.localizedDescription)
            }
            
        }
        
        func fetchDataFromCoreData() -> [NSManagedObject]
        {
            
            var users = [NSManagedObject]()
            let appDel = UIApplication.shared.delegate as? AppDelegate
            
            if #available(iOS 10.0, *)
            {
                let content = appDel?.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
                
                do {
                    users = try content?.fetch(fetchRequest) as! [NSManagedObject]
                    
                } catch let error as NSError {
                    
                    print(error.localizedDescription)
                }
                
            }
                
            else
            {
                let content = appDel?.managedObjectContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
                
                do {
                    users = try content?.fetch(fetchRequest) as! [NSManagedObject]
                    
                } catch let error as NSError {
                    
                    print(error.localizedDescription)
                }
                
            }
            
            return users
            
        }
    }
}

extension UITableViewController
{
    func fetchDataFromCoreData() -> [NSManagedObject]
    {
        
        var users = [NSManagedObject]()
        let appDel = UIApplication.shared.delegate as? AppDelegate
        
        if #available(iOS 10.0, *)
        {
            let content = appDel?.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do {
                users = try content?.fetch(fetchRequest) as! [NSManagedObject]
                
            } catch let error as NSError {
                
                print(error.localizedDescription)
            }
            
        }
            
        else
        {
            let content = appDel?.managedObjectContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do {
                users = try content?.fetch(fetchRequest) as! [NSManagedObject]
                
            } catch let error as NSError {
                
                print(error.localizedDescription)
            }
            
        }
        
        return users
        
    }
}





