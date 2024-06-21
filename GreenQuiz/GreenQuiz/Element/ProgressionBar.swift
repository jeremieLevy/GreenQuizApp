//
//  progressionBar.swift
//  GreenQuiz
//
//  Created by Apprenant 106 on 20/06/2024.
//

import SwiftUI

struct ProgressionBar: View {
    
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    var color1 = Color(.red)
    var color2 = Color(.green)
    
    var body: some View {
        let multiplier = width / 100
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
            .foregroundStyle(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundStyle(.clear)
        }
    }
}

#Preview {
    ProgressionBar()
}
