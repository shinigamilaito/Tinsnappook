//
//  Post.swift
//  Tinsnappook
//
//  Created by Usuario on 09/05/18.
//  Copyright © 2018 edgarespindola. All rights reserved.
//  Email: edgareduardoespindola@gmail.com
//

import Foundation
import Firebase

struct Post {
    let uid: String?
    var image: UIImage?
    let message: String
    let userID: String
    var friend: Friend?
    
    init(uid: String?, message: String, userID: String) {
        self.uid = uid
        self.message = message
        self.userID = userID
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let message = value["message"] as? String,
            let userID = value["userID"] as? String else {
                return nil
        }
        
        self.uid = snapshot.key
        self.message = message
        self.userID = userID        
    }
    
    func toAnyObject() -> Any {
        return [
            "message": message,
            "userID": userID
        ]
    }
}
