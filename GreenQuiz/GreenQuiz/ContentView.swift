//
//  ContentView.swift
//  GreenQuiz
//
//  Created by Apprenant 43 on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
    @State var showLogin = true
    
    var body: some View {
        

            
            TabView(selection: $tabSelection){
                
                GardenView(gardenTitle: GardenViewModel())
                    .tag(1)
                
                
                QuizPageView()
                    .tag(2)
                
                
                RecueilTheme()
                    .tag(3)
                
            }
            .overlay(alignment : .bottom) {
                CustomTabView(tabSelection: $tabSelection)
            }
        
        .fullScreenCover(isPresented: $showLogin, content: {
            LoginView(showLogin: $showLogin)
        })
        
    }
}


#Preview {
    ContentView()
}
