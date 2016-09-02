//
//  Person.swift
//  select_w2_lab
//
//  Created by Dang Quoc Huy on 6/28/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import Foundation

struct Person {
    let id: NSNumber?
    let name: String?
    let birthdate: String?
    let height: NSNumber?
    let avatarImageURL: NSURL?
    
    init(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? NSNumber
        name = dictionary["name"] as? String
        birthdate = dictionary["birthdate"] as? String
        height = dictionary["height"] as? NSNumber
        if let avatarURLString = dictionary["picture"] as? String {
            avatarImageURL = NSURL(string: avatarURLString)!
        } else {
            avatarImageURL = nil
        }
    }
}
