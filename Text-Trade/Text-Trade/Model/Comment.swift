//
//  Comment.swift
//  Text-Trade
//
//  Created by Steven Perrin on 4/26/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import Foundation

class Comment {
    var content: String
    var senderID: String
    
    init(content: String, senderID: String){
        self.content = content
        self.senderID = senderID
    }
}
