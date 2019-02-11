//
//  FirebaseAPI.swift
//  chatExample
//
//  Created by Ajay Merchia on 2/11/19.
//  Copyright © 2019 Ajay Merchia. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseAPI {
    static func getUser(named name: String, completion: @escaping (User?) -> ()) {
        let uid = Utils.hash(name)
        
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value) { (snap) in
            guard let data = snap.value as? [String: String] else {
                completion(nil)
                return
            }
            
            completion(User(key: uid, record: data))
            
        }
    }
    
    static func upload(user: User, completion: @escaping ()->()) {
        Database.database().reference().child("users").child(user.uid).updateChildValues(user.createPushable()) { (err, ref) in
            completion()
        }
    }
    
    static func send(msg: Message, completion: @escaping () -> ()) {
        Database.database().reference().child("chat").child(msg.uid).setValue(msg.createPushable()) { (err, ref) in
            completion()
        }
    }
    
    static func loadChat(completion: @escaping ([Message]) -> () ) {
        Database.database().reference().child("chat").observeSingleEvent(of: .value) { (snap) in
            var ret = [Message]()
            
            guard let data = snap.value as? [String: [String: Any?]] else {
                completion(ret)
                return
            }
            
            for (msgID, msgData) in data {
                ret.append(Message(key: msgID, record: msgData))
            }
            
            completion(ret)
            
        }
    }
    
    static func listenForChats(onNewMessage: @escaping (Message) -> () ) {
        Database.database().reference().child("chat").observe(.childAdded) { (snap) in
            guard let data = snap.value as? [String: Any?] else {
                return
            }
            
            onNewMessage(Message(key: snap.key, record: data))
            
        }
    }
    
}
