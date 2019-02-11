//
//  LoginVC-system.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//
// System - Segues, Observers, Managers, and UI Event Triggers

import Foundation
import UIKit
import ARMDevSuite

extension LoginVC {
    func setupManagers() {
        alerts = AlertManager(vc: self)
    }

    override func viewWillAppear(_ animated: Bool) {

    }

    override func viewDidAppear(_ animated: Bool) {

    }

    override func viewWillDisappear(_ animated: Bool) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chatVC = segue.destination as? ChatVC {
            chatVC.user = self.user
            chatVC.messages = self.msgs
        }
    }

    // Segue Out Functions
    

}
