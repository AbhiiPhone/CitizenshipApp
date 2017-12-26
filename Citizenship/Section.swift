//
//  Section.swift
//  Citizenship
//
//  Created by MAC MINI3 on 20/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import Foundation

struct Section{
    var question: String!
    var answer: [String]!
    var expanded: Bool!
    
    init(question: String,answer: [String],expanded: Bool) {
        
        self.question = question
        self.answer = answer
        self.expanded = expanded
    }
}


struct New{
    var option: String!
    var ex: Bool!
    
    init(option: String,ex: Bool) {
        self.option = option
        self.ex = ex
    }
}
