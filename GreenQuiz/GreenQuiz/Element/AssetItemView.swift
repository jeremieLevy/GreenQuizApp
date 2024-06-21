//
//  AssetItemView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct AssetItemView: View {
    
    var asset: Asset
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .scaledToFit()
                .frame(width: 170)
                .overlay() {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 1.5)
            }
            Image(asset.image)
                .resizable()
                .scaledToFit()
                .frame(width: 160)
        }
        .padding()
    }
}

#Preview {
    AssetItemView(asset: Asset(image: "Asset01", name: "Little Flower 01"))
}
