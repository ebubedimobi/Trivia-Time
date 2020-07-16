//
//  Question.swift
//  Trivia Time
//
//  Created by Ebubechukwu Dimobi on 06.07.2020.
//  Copyright © 2020 blazeapps. All rights reserved.
//

import Foundation


struct Question {
    let text: String
    let answer: String
    let options: [String]
    
    init(q: String,  o: [String], a: String) {
        text = q
        answer = a
        options = o
        
    }
}
