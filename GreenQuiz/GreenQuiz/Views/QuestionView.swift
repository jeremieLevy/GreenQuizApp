//
//  QuestionView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 20/06/2024.
//

import SwiftUI

struct QuestionView: View {
    @State var question: Question

    
    var body: some View {
        Text("")
        VStack {
            Text(question.title)
                .padding(.top, 100)
            Spacer()
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {

            }
        }
    }
}

#Preview {
    QuestionView(question: Question(title: "Zerma le jean ?"))
}
