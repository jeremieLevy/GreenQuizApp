//
//  RecueilList.swift
//  GreenQuiz
//
//  Created by Axel Remy on 19/06/2024.
//

import SwiftUI

struct RecueilList: View {
    @State var searchText: String = ""
    var theme: Theme
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    SearchBarPerso(searchText: $searchText)
                    ForEach(theme.factLists) { funfact in
                        if  searchText.isEmpty ||
                                funfact.description.localizedStandardContains(searchText) || funfact.theme.localizedStandardContains(searchText){
                            NavigationLink {
                                FunFactDetail(funfact: funfact)
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundStyle(.white)
                                        .overlay() {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.black, lineWidth: 1)
                                        }.frame(height: 50)
                                    HStack {
                                        Text(funfact.titre)
                                            .foregroundStyle(.black)
                                            .font(.headline)
                                        Spacer()
                                        Text("Detail  >")
                                            .foregroundStyle(.gray)
                                    }.padding()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                .navigationTitle(theme.theme)
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

#Preview {
    RecueilList(theme: Theme(theme: "Recyclage", tImage: "rr", factLists: recyclages))
}
