//
//  TableViewHelpers.swift
//  QuizAppTests
//
//  Created by Dinara Shadyarova on 29.07.2025.
//

import UIKit

extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        dataSource?.tableView(
            self,
            cellForRowAt: IndexPath(row: row, section: 0)
        )
    }
    
    func title(at row: Int) -> String? {
        cell(at: row)?.textLabel?.text
    }
    
    func select(at row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate?.tableView?(
            self,
            didSelectRowAt: indexPath
        )
    }
    
    func deselect(at row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        deselectRow(at: indexPath, animated: false)
        delegate?.tableView?(
            self,
            didDeselectRowAt: indexPath
        )
    }
}
