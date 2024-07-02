  //
  //  RecueilList.swift
  //  GreenQuiz
  //
  //  Created by Axel Remy on 19/06/2024.
  //

import SwiftUI

struct RecueilList: View {
  
  @State var searchText: String = ""
  @State public var questions_vm = QuestionViewModel()
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
      sortData()
    }
  }
  
  var body: some View {
    NavigationStack{
      ScrollView{
        VStack{
          SearchBarPerso(searchText: $searchText)
          if sortData().count == 0 {
            Text("Question introuvable !")
          } else {
            ForEach(sortData()) { question in
                //            if  searchText.isEmpty ||
                //                  funfact.description.localizedStandardContains(searchText) || funfact.theme.localizedStandardContains(searchText){
              NavigationLink {
                FunFactDetail(content: question.fields.annecdote, title: question.fields.title)
              } label: {
                ZStack{
                  Rectangle()
                    .foregroundStyle(.white)
                    .overlay() {
                      RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                    }.frame(height: 50)
                  HStack {
                    Text(question.fields.title)
                      .foregroundStyle(.black)
                      .font(.headline)
                    Spacer()
                    Text("Detail  >")
                      .foregroundStyle(.gray)
                  }.padding()
                }
              }
              .padding(.horizontal)
              .navigationTitle("")
            }
          }
          Spacer()
        }
        .onAppear(){
          fetchData()
        }
        .toolbarBackground(.greeny, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar(content: {
          ToolbarItem(placement: .topBarTrailing) {
            ProfilButton()
            
          }
        })
      }
    }
  }
}

//#Preview {
// RecueilList(theme: ))
//}
