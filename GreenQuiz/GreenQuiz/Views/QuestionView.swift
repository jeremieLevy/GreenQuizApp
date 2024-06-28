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
  @State public var questions_vm = QuestionViewModel()
  @State public var themes_vm = ThemeViewModel()
  @State var indexQuestions = 0
  @State var options: [String]
  @State var quizScore = 0
  @State var isComplete = false
  @State var themeId = ""
  
    //  Appel l'API
  func fetchData() {
    Task{
      await questions_vm.fetchQuestions()
      sortData()
      await themes_vm.fetchThemes()
      convertOptions()
    }
  }
  
  func sortData() -> [Question] {
    var questionsSort: [Question] = []
    for question in questions_vm.questions {
      if question.fields.theme[0] == themeId {
        questionsSort.append(question)
      }
    }
    print(questionsSort)
    return questionsSort
  }
  
    //  Convertis les options de réponses en un tableau exploitable
  func convertOptions() {
    let convertableOptions = questions_vm.questions[indexQuestions].fields.options
    options = convertableOptions.components(separatedBy: ",")
  }
  
    // Vérifie que la réponse choisie est la bonne en ajoutant 1 au score si cela est vraie et passe a la suivante
  func verifyAnswer(option: String) {
    if option == questions_vm.questions[indexQuestions].fields.answer {
      quizScore += 1
    }
    indexQuestions += 1
    fetchData()
  }
  
  var body: some View {
    NavigationStack{
      VStack {
        if questions_vm.questions.isEmpty || themes_vm.themes.isEmpty {
          Text("Erreur réseau.")
            .padding()
        } else {
            // Partie question
          NavigationLink("", destination: QuizCompleteView(), isActive: $isComplete)
          VStack{
            HStack{
              Text("Score total:")
              Spacer()
              Text("\(quizScore)")
            }
            .padding()
            .frame(width: 375, height: 75)
            .foregroundStyle(.white)
            .font(.title)
            .bold()
            .background(Color(backgroundColor))
            .clipShape(.rect(cornerRadius: 10))
            Spacer()
            HStack{
              Text(questions_vm.questions[indexQuestions].fields.loopThemeId(target: questions_vm.questions[indexQuestions].fields.theme[0], themes: themes_vm.themes))
                .font(.title)
                .foregroundStyle(Color(backgroundColor))
                .bold()
              Spacer()
            }
            Spacer()
            Text(questions_vm.questions[indexQuestions].fields.question)
              .padding()
              .font(.title)
              .frame(width: 369, height: 225)
              .foregroundStyle(Color(backgroundColor))
              .clipShape(.rect(cornerRadius: 15))
              .bold()
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color(backgroundColor), lineWidth: 6)
              )
            Spacer()
              // Partie réponses
            VStack(spacing: 15){
              ForEach(options, id: \.self) { option in
                Button(action: {
                  if indexQuestions > 10 {
                    isComplete.toggle()
                  }
                  verifyAnswer(option: option)
                }, label: {
                  HStack{
                    Text(option)
                      .font(.system(size: 18))
                      .bold()
                    Spacer()
                    Image(systemName: "chevron.left.circle.fill")
                  }
                  .padding(0)
                  Spacer()
                })
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
            Text("Réponse attendues: \(questions_vm.questions[indexQuestions].fields.answer)")
          }
          .padding()
        }
      }
      .onAppear {
          // Appeler le service pour charger les données dès que l'écran se charge
        fetchData()
      }
      .frame(width: 375)
      Spacer()
    }
  }
}

#Preview {
  QuestionView(options: [""])
}
