//
//  GardenView.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 28/06/2024.
//

import SwiftUI

struct GardenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.primaryApp)
                VStack {
                    HStack {
                        Spacer()
                        ProfilButton()
                    }.padding(.horizontal)
                    Text("Garden Title")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                    Image("GardenView")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .shadow(radius: 10, y: 30)
                    ShareLink(item: String("Share".description)) {
                        VStack {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                            Text("Partager")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                    }
                    NavigationLink {
                        QuestionView(options: [""])
                    } label: {
                        QuizOfTheDayButton()
                            .padding(.top, 40)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    GardenView()
}




