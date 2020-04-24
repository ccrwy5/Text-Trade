//
//  UserProfiles.swift
//  Text-Trade
//
//  Created by Chris Rehagen on 3/20/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import Foundation

class UserProfile {
    var uid: String
    var username: String
    var photoURL: URL
    var phoneNumber: String
    var email: String
    var fullName: String
    
    init(uid: String, username: String, photoURL:URL, phoneNumber: String, email: String, fullName: String) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
        self.phoneNumber = phoneNumber
        self.email = email
        self.fullName = fullName
    }
}

