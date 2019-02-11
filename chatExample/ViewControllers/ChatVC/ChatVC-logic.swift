//
//  ChatVC-logic.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//
// Logic - Functions relating to the core functionality/value prop of the application.

import Foundation
import UIKit
import ARMDevSuite

extension ChatVC {
    @objc func sendTextMessage() {
        //        if needsRefresh() {
        //            self.chatView.reloadData()
        //        }
        composeTextField.becomeFirstResponder()
        self.sendButton.isEnabled = false
        guard let msg = composeTextField.text else { return }
        self.composeTextField.text = ""
        
        if msg == "" {
            return
        }
        
        let textMessage = Message(msg: msg, sender: self.user)
        messages.append(textMessage)
        
        FirebaseAPI.send(msg: textMessage) {
            debugPrint("messageSent")
        }
        
        
        addMessage()
        
        
    }
    
    func addMessage() {
        self.chatView.beginUpdates()
        self.chatView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        self.chatView.endUpdates()
    }


}
