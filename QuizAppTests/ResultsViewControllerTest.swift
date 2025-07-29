//
//  ResultsViewControllerTest.swift
//  QuizApp
//
//  Created by Dinara Shadyarova on 29.07.2025.
//

import XCTest
@testable import QuizApp

class ResultsViewControllerTest: XCTestCase {
    func test_viewDidLoad_summaryHeaderText() {
        let sut = makeSUT(summary: "Summary")
        XCTAssertEqual(sut.headerLabel.text, "Summary")
    }
    
    func test_viewDidLoad_rendersAnswers() {
        let sut = makeSUT(answers: [])
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        let sut2 = makeSUT(answers: [makeDummyAnswer()])
        XCTAssertEqual(sut2.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withCorrectAnswer_rendersCorrectAnswerCell() {
        let sut = makeSUT(answers: [PresentableAnswer(isCorrect: true)])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
    }
    
    func test_viewDidLoad_withWrongAnswer_rendersWrongAnswerCell() {
        let sut = makeSUT(answers: [PresentableAnswer(isCorrect: false)])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
    }
    
    // MARK: Helpers
    func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        let _ = sut.view
        return sut
    }
    
    func makeDummyAnswer() -> PresentableAnswer {
        PresentableAnswer(isCorrect: false)
    }
}
