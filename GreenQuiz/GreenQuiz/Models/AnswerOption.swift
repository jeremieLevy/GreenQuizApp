//
//  AnswersOptions.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 20/06/2024.
//

import Foundation
struct AnswerOption: Identifiable {
    
    var id = UUID()
    
    let optionLetter: String
    let answersOptions: String
    
}
