  //
  //  QuizCompleteView.swift
  //  GreenQuiz
  //
  //  Created by Jessy Viranaiken on 28/06/2024.
  //

import SwiftUI
import ConfettiSwiftUI

struct QuizCompleteView: View {
  
  @State private var isActive = false
  @State private var counter = 0
  
  var backgroundColor = "PrimaryAppColor"
  @Binding var score: Int
  
  var body: some View {
    NavigationStack{
      VStack{
        NavigationLink("", isActive: $isActive) {
          QuizPageView()
        }
        Spacer()
        VStack(spacing: 20){
          Text("Quiz compléter,\nmerci d'avoir jouer !")
            .font(.largeTitle)
            .foregroundStyle(Color(backgroundColor))
            .bold()
          VStack(spacing: 50){
            Text("Votre score total")
              .font(.title2)
              .foregroundStyle(Color(backgroundColor))
              .bold()
            HStack {
              Text("\(score)")
            }
            .confettiCannon(counter: $counter, confettis: [.text("🍃")], colors: [.primaryApp], confettiSize: 20, repetitions: 2, repetitionInterval: 0.7)
            .font(.system(size: 75))
            .foregroundStyle(Color(backgroundColor))
            .bold()
          }
        }
        Spacer()
        Button(action: {
          isActive.toggle()
        }, label: {
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
        Spacer()
      }
      .padding()
    }
    .onAppear{
      counter += 1
    }
    .navigationBarHidden(true)
  }
}

#Preview {
  QuizCompleteView(score: .constant(0))
}
