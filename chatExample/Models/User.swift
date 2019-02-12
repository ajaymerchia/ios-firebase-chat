//
//  User.swift
//  mdb-ios-mp5_message_my_friends
//
//  Created by Ajay Merchia on 2/2/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//

import Foundation
import UIKit
import CryptoSwift
import ARMDevSuite

class User: Equatable, Comparable {

    // REQUIRED
    var uid: String!
    var first: String!
    
    // USER INFO
    var fcmToken: String?
    
    init(first: String) {
        uid = LogicSuite.hash(first)
        self.first = first
    }
    
    func createPushable() -> [String : Any?] {
        var ret = [String: Any?]()
        
        ret["first"] = first
        ret["fcm"] = fcmToken
        
        return ret
    }
    
    required init(key: String, record: [String : Any?], _ withFriends: Bool = false) {
        updateUser(key: key, record: record, withFriends)
    }
    
    func updateUser(key: String, record: [String : Any?], _ withFriends: Bool = false) {
        self.uid = key
        self.first = record["first"] as? String ?? nil
        self.fcmToken = record["fcm"] as? String ?? nil
        
    }
    
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    static func == (lhs: String, rhs: User) -> Bool {
        return lhs == rhs.uid
    }
    
    static func == (lhs: User, rhs: String) -> Bool {
        return lhs.uid == rhs
    }
    
    static func < (lhs: User, rhs: User) -> Bool {
        return lhs.first < rhs.first
    }
    
    
    
}
