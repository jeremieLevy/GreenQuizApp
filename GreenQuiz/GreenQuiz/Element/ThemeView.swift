//
//  ThemeView.swift
//  GreenQuiz
//
//  Created by Axel Remy on 20/06/2024.
//

import SwiftUI

struct ThemeView: View {
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
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                }
    }
}

#Preview {
    ThemeView()
}
