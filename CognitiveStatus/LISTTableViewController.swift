//
//  LISTTableViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import CoreData

class LISTTableViewController: UITableViewController {
    
    var listUsers = [NSManagedObject]()
    var index:Int?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "LIST"
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "bg_main"))
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        listUsers.removeAll()
        let temp = fetchDataFromCoreData()
        
        for item in temp
        {
            self.listUsers.insert(item, at: 0)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
  
    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listUsers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LISTTableViewCell

        let user = listUsers[indexPath.row]
        cell.lblName.text = user.value(forKey: "name") as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = listUsers[indexPath.row]
        print(user)
        
        let name = user.value(forKey: "name") as? String
        let isPersonAlert = user.value(forKey: "isPersonAlert") as? Bool
        let dateOfBirth = user.value(forKey: "dateOfBirth") as? String
        let levelOfEducation = user.value(forKey: "levelOfEducation") as? String
        let sex = user.value(forKey: "sex") as? Bool
        let ethnicity = user.value(forKey: "ethnicity") as? String
        let age = user.value(forKey: "age") as? Int
        let work = user.value(forKey: "work") as? String
        let score = (user.value(forKey: "score") as? Int)!
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        
        detailVC.name = name
        detailVC.dateOfBirth = dateOfBirth
        detailVC.levelOfEducation = levelOfEducation
        detailVC.ethnicity = ethnicity
        detailVC.work = work
        detailVC.age = age
        detailVC.sex = sex
        detailVC.isPersonAlert = isPersonAlert
        detailVC.score = score
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UI_USER_INTERFACE_IDIOM() == .phone
        {
            return 44
        }
        else
        {
            return 60
        }
    }
    
}
