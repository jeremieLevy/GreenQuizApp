//
//  GardenCustomView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 01/07/2024.
//

import SwiftUI


struct GardenCustomView: View {
    
    @State private var gardenPlateform: [AssetModel] = []
    
    @State private var showingAssets = false
    @Binding var gardenNameField: GardenViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.greeny)
                VStack(alignment: .trailing) {
                    TextField("", text: $gardenNameField.gardenName, prompt: Text("Nommez votre jardin (max 15)").fontWeight(.medium).font(.system(size: 20)).foregroundStyle(.white.opacity(0.5)))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.bottom, -50)
                    Image("GardenView")
                        .resizable()
                        .frame(width: 700, height: 700)
                        .shadow(radius: 10, y: 50)
                        .padding(.top, -50)
                        
                    Button {
                        showingAssets.toggle()
                    } label: {
                        Image(systemName: "leaf.fill")
                    }
                    .sheet(isPresented: $showingAssets, content: {AssetView()})
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(.horizontal, 200)
                    .padding(.top, -100)

                }
            }
        }
    }
}

#Preview {
    GardenCustomView(gardenNameField: .constant(GardenViewModel(gardenName: "")))
}
