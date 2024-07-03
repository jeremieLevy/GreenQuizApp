//
//  AssetItemView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct AssetItemView: View {
    
    var asset: AssetModel
    
    @State private var position: CGSize = .zero
    
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
            if let imageUrl = URL(string: asset.fields.image[0].url) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .offset(position)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        self.position = value.translation
                                    }
                                    .onEnded { value in
                                        self.position = value.translation
                                    }
                            )
                    case .failure:
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    AssetItemView(asset: AssetModel(id: "", fields: AssetFields(name: "", image: [Plant(url: "https://v5.airtableusercontent.com/v3/u/30/30/1719964800000/Cp_eNgrA8QV6QYpeqX-wyw/osGUs_gm-6x6Gk2n3KHNzdwSgDWQLMqIIgV-Cb5ZL87pKGQrrCUfV1eUatCIrEI3yHoBG7Y-C_ZxawUHCo4xV3pIipeAPC-FwCxDgtpgM2mMHnCX9waOf7DtnXTS3rQIGmxfI9oLijoVmxD2eFtAflLvbHY2VeoV4luBtyFlbu4/2QoZL5-0t7HkG9odxxEuPH2lfMRVm4Os3VuGDF04ve4")])))
}
