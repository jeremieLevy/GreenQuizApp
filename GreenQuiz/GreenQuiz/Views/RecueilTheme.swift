//
//  RecueilTheme.swift
//  GreenQuiz
//
//  Created by Axel Remy on 19/06/2024.
//

import SwiftUI

struct RecueilTheme: View {
    
    let adaptativeColumns = [
        GridItem(.adaptive(minimum: 168))
    ]
    
    @State var searchText: String = ""
    @State var theme_vm = ThemeViewModel()
    
    func fetchThemes() {
        Task{
            await theme_vm.fetchThemes()
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    SearchBarPerso(searchText: $searchText)
                    LazyVGrid(columns: adaptativeColumns, spacing: 16, content: {
                      ForEach(theme_vm.themes) { theme in
//                            if  searchText.isEmpty ||
//                                vm.theme.description.localizedStandardContains(searchText) || vm.theme.localizedStandardContains(searchText){
                            ZStack {
                                
                                NavigationLink {
                                  QuestionView(theme: theme)
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
                                            Text(theme.fields.theme)
                                                .bold()
                                                .frame(width: 150)
                                                .foregroundStyle(.black)
                                            AsyncImage(url: URL(string: theme.fields.picture[0].thumbnails.large.url)) { result in
                                                if let image = result.image {
                                                    image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 100)
                                                }
                                            }

                                        }
                                    }
                                    
                                }
//                                //                                }
                            }
                            
                        }
                        
                        
                    })
                    
                }
                .toolbarBackground(.greeny, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        ProfilButton()
                    }
                })
            }
            .onAppear {
                // Appeler le service pour charger les données
                fetchThemes()
            }
            
        }
    }
    
}

#Preview {
    RecueilTheme()
}
