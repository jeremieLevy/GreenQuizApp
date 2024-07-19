//
//  AssetsLibraryView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct AssetView: View {
    
    @State var viewModel = AssetViewModel()
    
    var body: some View {
        
        ZStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.primaryApp)
                ScrollView {
                    Spacer()
                    Text("Personnaliser le jardin")
                        .fontWeight(.bold)
                    Text("Choisissez un objet dans la bibliothèque")
                        .font(.footnote)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(viewModel.assets) { asset in
                            AssetItemView(asset: AssetModel(id: "", fields: AssetFields(name: "", image: [Plant(url: asset.fields.image[0].url)])))
                        }
                    }
                    .padding()
                    .padding(.top)
                }
            }
        }.onAppear {
            Task {
                await viewModel.fetchAssets()
            }
        }
    }
}

#Preview {
    AssetView()
}
