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
    
    func test_viewDidLoad_withCorrectAnswer_configuresCell() {
        let answer = makeAnswer(question: "Q1", answer: "A1", isCorrect: true)
        let sut = makeSUT(answers: [answer])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.answerLabel.text, "A1")
    }
    
    func test_viewDidLoad_withWrongAnswer_configuresCell() {
        let answer = makeAnswer(question: "Q1", answer: "A1", isCorrect: false)
        let sut = makeSUT(answers: [answer])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.correctAnswerLabel.text, "A1")
    }
    
    // MARK: Helpers
    func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        let _ = sut.view
        return sut
    }
    
    func makeDummyAnswer() -> PresentableAnswer {
        makeAnswer(isCorrect: false)
    }
    
    func makeAnswer(question: String = "", answer: String = "", wrongAnswer: String? = nil, isCorrect: Bool) -> PresentableAnswer {
        PresentableAnswer(question: question, answer: answer, isCorrect: isCorrect)
    }
}
