//
//  StackOverflowService.swift
//  NetworkDemo
//
//  Created by Andrey Koltsov on 21/11/2018.
//  Copyright © 2018 Peter the Great St.Petersburg Polytechnic University. All rights reserved.
//

import Foundation

protocol IStackOverflowService {
    func requestQuestions(completion: @escaping ([Question]?, Error?) -> Void)
}

// "final" for optimization purposes. It means we can't inherit from it
final class StackOverflowService: IStackOverflowService {
    
    private let urlString = "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow"
    
    // Dependencies
    let session: URLSession
    
    // MARK: - Init
    init(session: URLSession) {
        self.session = session
    }
    
    // MARK: - IStackOverflowService
    func requestQuestions(completion: @escaping ([Question]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                completion(nil, error)
            } else if let data = data {
                let stackoverflowResponse = try? JSONDecoder().decode(StackOverflowResponse.self, from: data)
                completion(stackoverflowResponse?.items, nil)
            }
        }
        dataTask.resume() // NOTE: Make sure to call this
    }
}
