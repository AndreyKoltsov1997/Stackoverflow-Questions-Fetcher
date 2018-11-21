//
//  StackOverflowService.swift
//  NetworkDemo
//
//  Created by Andrey Koltsov on 21/11/2018.
//  Copyright © 2018 Peter the Great St.Petersburg Polytechnic University. All rights reserved.
//

import Foundation

protocol IStackOverflowService {
    func requestQuestions(completion: ([]) -> Void)
}

// "final" for optimization purposes. It means we can't inherit from it
final class StackOverflowService: IStackOverflowService {
    
    // Dependencies
    let session: URLSession
    
    // MARK: - Init
    init(session: URLSession) {
        self.session = session
    }
}
