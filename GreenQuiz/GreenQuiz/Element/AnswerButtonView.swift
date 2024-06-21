//
//  AnswerButtonView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 20/06/2024.
//

import SwiftUI

struct AnswerButtonView: View {
    var optionLetter: String
    var answerOption: String
    
    var body: some View {
        VStack {
            Button {
            } label: {
                ZStack {
                    Circle()
                        .scaledToFit()
                        .frame(width: 70)
                        .foregroundStyle(.primaryApp)
                        .overlay {
                            Text(optionLetter)
                                .fontWeight(.bold)
                                .font(.system(size: 40))
                                .foregroundStyle(.white)
                                .shadow(radius: 10)
                        }
                }
            }
            Text(answerOption)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    AnswerButtonView(optionLetter: "A", answerOption: "100L")
}





