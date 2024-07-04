//
//  ContentView.swift
//  GreenQuiz
//
//  Created by Apprenant 43 on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
    
    @AppStorage("isLogged") var isLogged: Bool = true
    
    var body: some View {
            TabView(selection: $tabSelection){
                GardenView(gardenTitle: GardenViewModel(), tabSelection: $tabSelection)
                    .tag(1)
                QuizPageView()
                    .tag(2)
                RecueilTheme()
                    .tag(3)
            }
            .overlay(alignment : .bottom) {
                CustomTabView(tabSelection: $tabSelection)
            }
        
        .fullScreenCover(isPresented: $isLogged, content: {
            LoginView(isLogged: $isLogged)
            
        })
    }
}

#Preview {
    ContentView()
}
