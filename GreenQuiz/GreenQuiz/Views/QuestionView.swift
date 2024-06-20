//
//  QuestionView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 20/06/2024.
//

import SwiftUI

struct QuestionView: View {
    @State var question: Question
    @State var vmAnswers: AnswersViewModel

    
    var body: some View {
        Text("")
        VStack {
            Text(question.title)
                .padding(.top, 100)
            Spacer()
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(vmAnswers.getAllAnswers()) { answer in
                    AnswerButtonView(optionLetter: answer.optionLetter, answerOption: answer.answersOptions)
                        .padding(.bottom, 50)
                }
            }
        }
    }
}

#Preview {
    QuestionView(question: Question(title: "Combien de L pour un Jean ?"), vmAnswers: AnswersViewModel())
}
