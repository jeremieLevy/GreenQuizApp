//
//  QuizOfTheDayButton.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 28/06/2024.
//

import SwiftUI

struct QuizOfTheDayButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.white)
            .frame(width: 320, height: 45)
            .overlay() {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                HStack {
                    Text("Lancer un Quiz")
                        .foregroundStyle(.primaryApp)
                        .font(.title2)
                        .padding(.leading)
                }
            }
    }
}

#Preview {
    QuizOfTheDayButton()
}
