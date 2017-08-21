//
//  RoundSwitch.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
@IBDesignable

class UISwitchCustom: UISwitch {
    
    @IBInspectable var OffTint: UIColor? {
        didSet {
            self.tintColor = OffTint
            self.layer.cornerRadius = 15.5
            self.backgroundColor = OffTint
        }
    }
}
