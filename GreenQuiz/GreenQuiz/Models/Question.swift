//
//  Question.swift
//  GreenQuiz
//
//  Created by Jessy Viranaiken on 26/06/2024.
//

import Foundation

struct QuestionResponse: Codable {
  var records: [Question]
}

struct Question: Identifiable, Codable {
  let id: String
  let createdTime: String
  let fields: QuestionFields
}

struct QuestionFields: Codable {
  let answer: String
  let question: String
  let options: String
  let annecdote: String
  let title: String
  let theme: [String]
  
  func loopThemeId(target: String, themes: [Theme]) -> String {
    var targetTheme: String
    for theme in themes {
      if target == theme.id {
        targetTheme = theme.fields.theme
        return targetTheme
      }
    }
    return "Thème non attribué"
  }
  
    //  Convertis les options de réponses en un tableau exploitable
  func convertOptions() -> [String] {
    let convertableOptions = options
    var convertOptions = convertableOptions.components(separatedBy: ",")
    return convertOptions
  }
}
