  //
  //  testView.swift
  //  GreenQuiz
  //
  //  Created by Apprenant 43 on 25/06/2024.
  //

import SwiftUI

struct testView: View {
  
  @State var viewModel = QuestionViewModel()
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
          Text(viewModel.questions[indexQuestions].fields.question)
            .padding()
          VStack{
            ForEach(options, id: \.self) { option in
              Text(option)
            }
          }
        }
      }
    }
    .onAppear {
        // Appeler le service pour charger les données
      fetchQuestions()
    }
    
    Button("Refresh") {
        // Appeler le service pour charger les données
      indexQuestions += 1
      fetchQuestions()
    }
  }
}

#Preview {
  testView(options: [""])
}
