  //
  //  QuestionView.swift
  //  GreenQuiz
  //
  //  Created by Jérémie Levy on 20/06/2024.
  //

/* (En attendant d'implémenter Swift Data)
 
 - @State var viewModel = QuestionViewModel()
 - La fonction d'appel:
 func fetchQuestions() {
 Task{
 await viewModel.fetchQuestions()
 } (Ne pas oublier de placer un .onAppear())
 
 Si vous avez besoin des options(réponses):
 
 func convertOptions() {
 let convertableOptions = viewModel.questions[indexQuestions].fields.options
 options = convertableOptions.components(separatedBy: ",")
 }
 func fetchQuestions() {
 Task{
 await viewModel.fetchQuestions()
 convertOptions()
 }
 }
 
 A partir de la vous pourrez exploiter:
 - Les questions: viewModel.questions[indexQuestions].fields.question
 - Les réponses: juste options
 - L'annecdote: viewModel.questions[indexQuestions].fields.annecdote
 - Answer: idem qu'au dessus en remplacant annecdote par .answer
 etc... 💪🏽
 
 }*/

import SwiftUI

struct QuestionView: View {
  
  var backgroundColor = "PrimaryAppColor"
  @State public var viewModel = QuestionViewModel()
  @State var indexQuestions = 0
  @State var options: [String]
  
  func convertOptions() {
    let convertableOptions = viewModel.questions[indexQuestions].fields.options
    options = convertableOptions.components(separatedBy: ",")
  }
  
  func fetchQuestions() {
    Task{
      await viewModel.fetchQuestions()
      convertOptions()
    }
  }
  
  var body: some View {
    VStack {
      if viewModel.questions.isEmpty {
        Text("Aucune question trouvée.")
          .padding()
      } else {
        VStack{
          Spacer()
          Text(viewModel.questions[indexQuestions].fields.question)
            .padding()
            .font(.title)
            .frame(width: 375)
            .background(Color(backgroundColor))
            .foregroundStyle(Color.white)
            .clipShape(.rect(cornerRadius: 15))
            .bold()
          Spacer()
          VStack(spacing: 15){
            ForEach(options, id: \.self) { option in
              HStack{
                Text(option)
                  .font(.system(size: 20))
                  .bold()
                Spacer()
                Image(systemName: "chevron.left.circle.fill")
              }
              .padding(0)
              if option != options.last {
                Divider()
              }
            }
          }
          .padding()
          .frame(width: 375)
          .background(Color(backgroundColor))
          .foregroundStyle(Color.white)
          .clipShape(.rect(cornerRadius: 15))
        }
      }
    }
    .onAppear {
        // Appeler le service pour charger les données
      fetchQuestions()
    }
    Spacer()
    Button("Refresh") {
        // Appeler le service pour charger les données
      indexQuestions += 1
      fetchQuestions()
    }
    Spacer()
  }
}

#Preview {
  QuestionView(options: [""])
}
