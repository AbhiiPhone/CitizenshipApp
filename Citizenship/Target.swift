//
//  Target.swift
//  Citizenship
//
//  Created by MAC MINI3 on 09/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import Foundation

struct Target{
    var question: String!
    var subtitle: [String]!
    var answer: [String]!
    var expanded: Bool!
    
    init(question: String,subtitle: [String],answer: [String],expanded: Bool) {
        
        self.question = question
        self.subtitle = subtitle
        self.answer = answer
        self.expanded = expanded
    }
}
