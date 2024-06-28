//
//  QuizCompleteView.swift
//  GreenQuiz
//
//  Created by Jessy Viranaiken on 28/06/2024.
//

import SwiftUI

struct QuizCompleteView: View {
  
//  @Binding var score: QuestionView
  var backgroundColor = "PrimaryAppColor"

    var body: some View {
      VStack{
        Spacer()
        Text("Quiz compléter, merci d'avoir jouer !")
          .font(.largeTitle)
          .foregroundStyle(Color(backgroundColor))
          .bold()
        Spacer()
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
          ZStack{
            Color(backgroundColor)
            Text("On recommence ?")
              .font(.title3)
              .foregroundStyle(.white)
              .bold()
          }
          .frame(width: 200, height: 50)
          .clipShape(.rect(cornerRadius: 8))
        })
      }
      .padding()
    }
}

#Preview {
  QuizCompleteView()
}
