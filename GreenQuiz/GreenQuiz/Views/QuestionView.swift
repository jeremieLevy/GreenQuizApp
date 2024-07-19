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
  @State private var quizScore = 0
  @State var isComplete = false
  var theme: Theme
  
    //  Trie les questions pour renvoyer les questions spécifiques aux thèmes en cours
  func sortData() -> [Question] {
    var questionsSort: [Question] = []
    for question in questions_vm.questions {
      if question.fields.theme[0] == theme.id {
        questionsSort.append(question)
      }
    }
    print(questionsSort)
    return questionsSort
  }
  
    //  Appel l'API
  func fetchData() {
    Task{
      await questions_vm.fetchQuestions()
      await themes_vm.fetchThemes()
    }
  }
  
    // Vérifie que la réponse choisie est la bonne en ajoutant 1 au score si cela est vraie et passe a la suivante
  func verifyAnswer(option: String, answer: String) {
    if option == answer {
      quizScore += 1
    }
    indexQuestions += 1
  }
  
  var body: some View {
    NavigationStack{
      VStack {
        if questions_vm.questions.isEmpty || themes_vm.themes.isEmpty {
          ZStack {
            Color.white
            ProgressView("Chargement en cours...")
              .progressViewStyle(CircularProgressViewStyle())
              .foregroundColor(.white)
              .padding()
              .background(Color(.primaryApp))
              .cornerRadius(10)
              .tint(.white)
          }
        } else if isComplete{
          QuizCompleteView(score: $quizScore)
        } else {
              // Partie question
          VStack{
              // Affichage de la question
            HStack{
              Text(theme.fields.theme)
                .font(.title)
                .foregroundStyle(.white)
                .bold()
              Spacer()
            }
            .padding()
            .frame(width: 375, height: 50)
            .background(Color(backgroundColor))
            .clipShape(.rect(cornerRadius: 10))
            Spacer()
            if sortData().count < indexQuestions {
              Text("Question introuvable !")
            } else {
              let question = sortData()[indexQuestions]
              Text(question.fields.question)
                .padding()
                .font(.title)
                .frame(width: 369)
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
                ForEach(question.fields.convertOptions(), id: \.self) { option in
                  Button(action: {
                    if indexQuestions == sortData().count - 1 {
                      isComplete.toggle()
                    }
                    withAnimation(.default){
                      verifyAnswer(option: option, answer: question.fields.answer)
                    }
                  }, label: {
                    HStack{
                      Text(option)
                        .font(.system(size: 18))
                        .bold()
                      Spacer()
                      Image(systemName: "chevron.left.circle.fill")
                    }
                    Spacer()
                  })
                  if option != question.fields.convertOptions().last {
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
          .padding()
        }
      }
      .onAppear {
          // Appeler le service pour charger les données dès que l'écran se charge
        fetchData()
          // Remet a 0 le score
        quizScore = 0
      }
      .frame(width: 375)
      Spacer()
    }
  }
}
