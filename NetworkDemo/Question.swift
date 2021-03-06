//
//  Question.swift
//  NetworkDemo
//
//  Created by Andrey Koltsov on 21/11/2018.
//  Copyright © 2018 Peter the Great St.Petersburg Polytechnic University. All rights reserved.
//

import Foundation

struct StackOverflowResponse: Codable {
    let items: [Question]?
}

struct Question: Codable {
    let title: String?
    let score: Int?
}
