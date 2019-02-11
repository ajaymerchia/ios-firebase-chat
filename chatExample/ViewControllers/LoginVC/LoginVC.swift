//
//  ViewController.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//

import UIKit
import ARMDevSuite

class LoginVC: UIViewController {

    var prompt: UILabel!
    var enterHere: ARMTextField!
    var button: UIButton!
    
    var user: User!
    var msgs: [Message]!
    var alerts: AlertManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupManagers()
        initUI()
    }


}

