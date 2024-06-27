//
//  Question.swift
//  GreenQuiz
//
//  Created by Jessy Viranaiken on 26/06/2024.
//

import Foundation

struct QuestionResponse: Decodable {
  var records: [Question]
}

struct Question: Identifiable, Decodable {
  let id: String
  let createdTime: String
  let fields: QuestionFields
}

struct QuestionFields: Decodable {
  let answer: String
  let question: String
  let options: String
  let annecdote: String
  let title: String
  let theme: [String]
}
