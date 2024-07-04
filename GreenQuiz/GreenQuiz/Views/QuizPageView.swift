  //
  //  QuizPageView.swift
  //  GreenQuiz
  //
  //  Created by Jérémie Levy on 19/06/2024.
  //

import SwiftUI

struct QuizPageView: View {
  
  @State var themes_vm = ThemeViewModel()
  
  func fetchThemes() {
    Task{
      await themes_vm.fetchThemes()
    }
  }
  
  var body: some View {
    NavigationStack{
      ScrollView {
        VStack(spacing: 40){
          QuizOfTheDayView()
          Text("Quiz divers")
            .font(.largeTitle)
          VStack{
            ForEach(themes_vm.themes) { theme in
              NavigationLink {
                QuestionView(theme: theme)
              } label: {
                QuizCatLongButtonView(catTitle: theme.fields.theme,
                                      catImage: "Capture d’écran 2024-06-19 à 18.13.20")
              }
            }
          }
        }
      }
      .onAppear(){
        fetchThemes()
      }
      .navigationBarHidden(true)
    }
  }
}

#Preview {
  QuizPageView()
}
