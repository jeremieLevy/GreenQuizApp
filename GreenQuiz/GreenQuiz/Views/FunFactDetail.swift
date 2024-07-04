//
//  FunFactDetail.swift
//  GreenQuiz
//
//  Created by Axel Remy on 20/06/2024.
//

import SwiftUI

struct FunFactDetail: View {
    
  var content: String
  var title: String
  
    var body: some View {
            VStack{
                Spacer()
                Text("Infos")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                Text(content)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                ShareLink(item: String(content)) {
                    VStack{
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                        Text("Partager")
                            .foregroundStyle(.black)
                            .font(.headline)
                    }
                }
                Spacer()
            }
            .navigationTitle(title)
            .toolbarBackground(.greeny, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    ProfilButton()
                    
                }
            })
    }
}

//#Preview {
//    FunFactDetail(funfact: recyclages.first!)
//}
