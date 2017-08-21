//
//  ToolViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class ToolViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TOOL"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textView.isScrollEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.isScrollEnabled = true
    }


}
