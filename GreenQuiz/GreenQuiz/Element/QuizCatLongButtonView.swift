//
//  QuizThemeLongButtonView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct QuizCatLongButtonView: View {
    var catTitle: String
    var catImage: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
          .foregroundStyle(.white)
          .frame(width: 320, height: 45)
          .overlay() {
            RoundedRectangle(cornerRadius: 20)
              .stroke(.black, lineWidth: 1.5)
            HStack {
              Text(catTitle)
                .padding(.leading)
                .foregroundStyle(.black)
              Spacer()
              Image(catImage)
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .padding(.trailing)
            }
          }
      }
    }

#Preview {
    QuizCatLongButtonView(catTitle: "Recyclage", catImage: "Capture d’écran 2024-06-19 à 18.13.07")
}
