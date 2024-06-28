//
//  ContentView.swift
//  GreenQuiz
//
//  Created by Apprenant 43 on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
            TabView(selection: $tabSelection){
                
                ProfilView()
                    .tag(1)
                
                
                QuizPageView()
                    .tag(2)
                
                
                ProfilView()
                    .tag(3)
                
            }
            .overlay(alignment : .bottom){
                CustomTabView(tabSelection: $tabSelection)
            }
        }
    }


#Preview {
    ContentView()
}
