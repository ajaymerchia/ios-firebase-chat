//
//  LoginVC-initUI.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//
// UI Initialization - Create the View

import Foundation
import UIKit
import ARMDevSuite
import ChameleonFramework

extension LoginVC {
    func initUI() {
        addLabel()
        addField()
        addButton()
        addTapDismiss()
    }

    // UI Initialization Helpers
    func addLabel() {
        self.prompt = UILabel(frame: LayoutManager.inside(inside: self.view, justified: .TopCenter, verticalPadding: 100, horizontalPadding: 0, width: view.frame.width/1.5, height: 50))
        prompt.text = "Just enter a name, and it'll generate a pseudo account using the hash of your name"
        prompt.lineBreakMode = .byWordWrapping
        prompt.numberOfLines = 0
        prompt.textAlignment = .center
        prompt.sizeToFit()
        
        view.addSubview(prompt)
        
    }
    
    func addField() {
        enterHere = ARMTextField(frame: LayoutManager.belowCentered(elementAbove: self.prompt, padding: 100, width: view.frame.width/1.5, height: 50))
        enterHere.placeholder = "First Name"
        
        enterHere.selectedTitleColor = .flatSkyBlue
        enterHere.selectedLineColor = .flatSkyBlue
        
        view.addSubview(enterHere)
        
    }
    
    func addButton() {
        button = UIButton(frame: LayoutManager.belowCentered(elementAbove: enterHere, padding: 100, width: view.frame.width/2, height: 40))
        button.setTitle("Enter Chat Room", for: .normal)
        button.setBackgroundColor(color: UIColor.flatSkyBlue, forState: .normal)
        button.addTarget(self, action: #selector(loginSignup), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    func addTapDismiss() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    @objc func dismissKeyboard() {
        enterHere.resignFirstResponder()
    }

}
