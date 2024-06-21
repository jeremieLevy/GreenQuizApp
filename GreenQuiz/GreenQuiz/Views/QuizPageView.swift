//
//  QuizPageView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import SwiftUI

struct QuizPageView: View {
    var body: some View {
        ScrollView {
            VStack {
                QuizOfTheDayView()
                Spacer()
                Text("Quiz divers")
                    .font(.largeTitle)
                QuizCatLongButtonView(catTitle: "Recyclage", 
                                      catImage: "Capture d’écran 2024-06-19 à 18.13.07")
                .padding(.bottom, 15)
                QuizCatLongButtonView(catTitle: "Maison",
                                      catImage: "Capture d’écran 2024-06-19 à 18.13.36")
                .padding(.bottom, 15)
                QuizCatLongButtonView(catTitle: "Energie",
                                      catImage: "Capture d’écran 2024-06-19 à 18.13.20")
                .padding(.bottom, 15)
                MixiquizButtonView()
            }
        }
    }
}

#Preview {
    QuizPageView()
}
