//
//  GardenCustomView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 01/07/2024.
//

import SwiftUI


struct GardenCustomView: View {
    
    @State private var showingAssets = false
    @Binding var gardenNameField: GardenViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.greeny)
                VStack() {
                    TextField("", text: $gardenNameField.gardenName, prompt: Text("Nommez votre jardin (max 15)").font(.title3).fontWeight(.medium))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    Image("GardenView-Resized-removebg")
                        .resizable()
                        .frame(width: 500, height: 400)
                        .shadow(radius: 10, y: 50)
                        .padding(.bottom, 100)
 
                    Button {
                        showingAssets.toggle()
                    } label: {
                        Image(systemName: "leaf.fill")
                    }
                    .sheet(isPresented: $showingAssets, content: {AssetView()})
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(.leading, 250)
                    .padding(.top, -70)
                }.padding(.top, 20)
            }
        }
    }
}

#Preview {
    GardenCustomView(gardenNameField: .constant(GardenViewModel(gardenName: "")))
}
