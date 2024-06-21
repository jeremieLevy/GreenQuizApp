//
//  RecueilTheme.swift
//  GreenQuiz
//
//  Created by Axel Remy on 19/06/2024.
//

import SwiftUI

struct RecueilTheme: View {
    
    var title: String
    
    let adaptativeColumns = [
        GridItem(.adaptive(minimum: 168))
    ]
    
    @State var searchText: String = ""
    @State var vm = ThemesViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    SearchBarPerso(searchText: $searchText)
                    LazyVGrid(columns: adaptativeColumns, spacing: 16, content: {
                        ForEach(vm.getAllThemes()) { theme in
                            if  searchText.isEmpty ||
                                    theme.factLists.description.localizedStandardContains(searchText) || theme.theme.localizedStandardContains(searchText){
                                ZStack {
                                    NavigationLink {
                                        RecueilList(theme: theme)
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundStyle(.white)
                                                .scaledToFit()
                                                .frame(width: 170)
                                                .overlay() {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(.black, lineWidth: 1.5)
                                                }
                                            VStack{
                                                Text(theme.theme)
                                                    .bold()
                                                    .frame(width: 150)
                                                    .foregroundStyle(.black)
                                                Image(theme.tImage)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 100)
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                    })
                }
                .navigationTitle(title)
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
    RecueilTheme(title: "Recueil")
}
