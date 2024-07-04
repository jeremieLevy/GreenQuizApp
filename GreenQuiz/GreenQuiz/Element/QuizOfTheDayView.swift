//
//  QuizOfTheDayView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct QuizOfTheDayView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 150)
                .foregroundStyle(.primaryApp)
            Text("Quiz du Jour")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            HStack {
                Rectangle()
                    .scaledToFit()
                    .frame(width: 200)
                    .rotationEffect(.degrees(-130))
                    .foregroundStyle(.redApp)
                    .padding(.top, 50)
                    .shadow(radius: 3)
                Spacer(minLength: 275)
                Rectangle()
                    .scaledToFit()
                    .frame(width: 200)
                    .rotationEffect(.degrees(-45))
                    .foregroundStyle(.yellowApp)
                    .padding(.bottom, 50)
                    .shadow(radius: 3)
            }
        }
        .frame(height: 225)
    }
}

#Preview {
    QuizOfTheDayView()
}
