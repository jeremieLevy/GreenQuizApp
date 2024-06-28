//
//  AssetItemView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct AssetItemView: View {
    
    var asset: AssetModel
    
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
            AsyncImage(url: URL(string: asset.fields.image[0].url)) { result in
                if let image = result.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
            }
            
        }
    }
}

#Preview {
    AssetItemView(asset: AssetModel(id: "", fields: AssetFields(name: "", image: [Plant(url: "https://v5.airtableusercontent.com/v3/u/30/30/1719576000000/hVGAo671EdKuOlvEfbsmcA/SR94oAEyVOq8RQ4YLmY_lW2u0v50I0DOdWic0efFhkldXg8s6XuPW8HgD1mK8yC3DJfPE4Z4CNMpRfQF8o6LeeEE_zhKhRGdWlzIEn9evz7usqYKxnw-UFnsws0AJKzgB1fz-4lqIP1WIvbZVtH3gBYG81L7GdGykU9Qv8bV1G8/JYg43fb5sip_cKkkTpVvRgXqn_XKqq2_fgY-bD-SOgA")])))
}
