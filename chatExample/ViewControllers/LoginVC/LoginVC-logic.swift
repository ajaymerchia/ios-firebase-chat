//
//  LoginVC-logic.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//
// Logic - Functions relating to the core functionality/value prop of the application.

import Foundation
import UIKit
import ARMDevSuite

extension LoginVC {
    @objc func loginSignup() {
        guard let name = enterHere.getText() else {
            enterHere.shake()
            return
        }
        
        debugPrint("Checking for user with ID: \(LogicSuite.hash(name))")
        
        LocalData.putLocalData(forKey: .name, data: name)
        
        FirebaseAPI.getUser(named: name) { (userOpt) in
            self.user = User(first: name)
            if let user = userOpt {
                self.user = user
            }
            
            if let token = LocalData.getLocalData(forKey: .fcmToken) {
                self.user.fcmToken = token
            }
            
            FirebaseAPI.upload(user: self.user, completion: {
                self.advance()
            })
        }
        
        
    }
    
    
    func advance() {
        FirebaseAPI.loadChat { (msgs) in
            self.msgs = msgs
            self.performSegue(withIdentifier: "login2chat", sender: self)
        }
        
    }
    
    

}
