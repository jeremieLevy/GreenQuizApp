//
//  ProfilButton.swift
//  GreenQuiz
//
//  Created by Axel Remy on 19/06/2024.
//

import SwiftUI

struct ProfilButton: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        
        Button(action: {
            showingSheet.toggle()
        }, label: {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 22))
                .foregroundStyle(.white)
        })
        .sheet(isPresented: $showingSheet, content: {
//            ProfilView()
        })
    }
}

#Preview {
    ProfilButton()
}
