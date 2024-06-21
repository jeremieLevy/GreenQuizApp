//
//  MixiquizButtonView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct MixiquizButtonView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.primaryApp)
            .frame(width: 320, height: 45)
            .overlay() {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 1.5)
                HStack {
                    Text("Mixiquizz")
                        .fontWeight(.bold)
                        .padding(.leading)
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
    }
}

#Preview {
    MixiquizButtonView()
}
