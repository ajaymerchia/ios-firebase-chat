//
//  Utils.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//

import Foundation
import CryptoSwift

class Utils {
    static func hash(_ str: String) -> String {
        let bytes = Data(bytes: Array(str.utf8)).sha256()
        return bytes.toHexString()
    }
}


