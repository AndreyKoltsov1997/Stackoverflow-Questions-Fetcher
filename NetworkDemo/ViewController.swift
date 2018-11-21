//
//  ViewController.swift
//  NetworkDemo
//
//  Created by Andrey Koltsov on 21/11/2018.
//  Copyright © 2018 Peter the Great St.Petersburg Polytechnic University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Dependencies
    private let stackoverflowService: StackOverflowService = StackOverflowService(session: URLSession.shared) // we're using shared session here
    
    // Private
    
    private var questions: [Question]?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadQuestions() {
        DispatchQueue.global().async {
            self.stackoverflowService.requestQuestions(completion: { [weak self] (questions, error) in
                if let error = error {
                    // todo: handle error here
                }
            })
        }
    }

}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
