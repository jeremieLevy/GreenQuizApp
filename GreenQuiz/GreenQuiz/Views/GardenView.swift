  //
  //  GardenView.swift
  //  GreenQuiz
  //
  //  Created by Jérémie Levy on 28/06/2024.
  //

import SwiftUI

struct GardenView: View {
    
    @State var gardenTitle: GardenViewModel
    
    @Binding var tabSelection: Int
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.greeny)
                VStack (spacing: 30) {
                    Text(gardenTitle.gardenName)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                        .padding(.bottom, -20)
                    NavigationLink {
                        GardenCustomView(gardenNameField: $gardenTitle)
                    } label: {
                        Image("GardenView-Customized")
                            .resizable()
                            .scaledToFit()
                            .shadow(radius: 10, y: 30)
                            .padding(.bottom, -20)
                    }
                    ShareLink(item: String("Share".description)) {
                        VStack {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                            Text("Partager")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                    }.padding(.bottom, -10)
                    QuizOfTheDayButton()
                        .onTapGesture {
                            tabSelection = 2
                        }
                    Spacer()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            ParametreView()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 26)
                                .foregroundStyle(.white)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        ProfilButton()
                    }
                })
            }
          }
        }
      }

//#Preview {
//  GardenView(gardenTitle: GardenViewModel())
//}




