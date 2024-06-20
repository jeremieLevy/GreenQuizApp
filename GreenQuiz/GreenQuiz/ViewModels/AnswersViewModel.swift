//
//  AnswersViewModel.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 20/06/2024.
//

import Foundation
class AnswersViewModel: ObservableObject {
    @Published var answers: [AnswerOption] = [
        AnswerOption(optionLetter: "A", answersOptions: "10L"),
        AnswerOption(optionLetter: "B", answersOptions: "100L"),
        AnswerOption(optionLetter: "C", answersOptions: "1000L"),
        AnswerOption(optionLetter: "D", answersOptions: "10 000L"),
    ]
    
    func getAllAnswers() -> [AnswerOption] {
        return answers
    }
}
