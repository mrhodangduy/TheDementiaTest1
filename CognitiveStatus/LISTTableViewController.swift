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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "LIST"
        self.tableView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_main"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        listUsers = fetchDataFromCoreData()
        tableView.reloadData()
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let user = listUsers[indexPath.row]
        cell.textLabel?.text = user.value(forKey: "name") as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        
        let user = listUsers[indexPath.row]
        
        detailVC.userDetail = user
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
}
