//
//  AssetsLibraryView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct AssetsLibraryView: View {
    @State var vmAssets = AssetsViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.primaryApp)
                .opacity(0.2)
            ScrollView {
                Spacer()
                Text("Personnaliser le jardin")
                    .fontWeight(.bold)
                Text("Choisissez un objet dans la bibliothèque")
                    .font(.footnote)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(vmAssets.getAllAssets()) { asset in
                        AssetItemView(asset: Asset(image: asset.image, name: asset.name))
                    }
                }
                .padding()
                .padding(.top)
            }
        }
    }
}

#Preview {
    AssetsLibraryView()
}
