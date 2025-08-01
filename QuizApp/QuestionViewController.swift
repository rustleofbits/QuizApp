//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Dinara Shadyarova on 27.07.2025.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private var question: String = ""
    private var options: [String] = []
    private let reuseIdentifier = "Cell"
    private var selection: (([String]) -> Void)? = nil
    
    convenience init(
        question: String,
        options: [String],
        selection: @escaping ([String]) -> Void
    ) {
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = question
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(selectedOptions())
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView.allowsMultipleSelection {
            selection?(selectedOptions())
        }
    }
    
    private func selectedOptions() -> [String] {
        guard let selectedRows = tableView.indexPathsForSelectedRows else { return [] }
        return selectedRows.map { options[$0.row] }
    }
    
    private func dequeueCell(in tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            return cell
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
    }

}

