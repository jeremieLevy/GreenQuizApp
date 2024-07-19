//
//  FactListModel.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 21/06/2024.
//

import Foundation

//struct Fields: Decodable {
//    let theme: String
//    let factslistmodel: [FactListModel]
//    let image: [Img]
//}

struct Img: Decodable {
    let url: String
}

struct FactListModel: Decodable {
//    var id: String
    var theme: String
    var title: String
    var description: String
    var answer: String
    var question: String
    var options: String
    
//    init(theme: String, title: String, description: String, answer: String, question: String, options: String) {
//        self.theme = theme
//        self.title = title
//        self.description = description
//        self.answer = answer
//        self.question = question
//        self.options = options
//    }
}
