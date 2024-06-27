////
////  FunFactDetail.swift
////  GreenQuiz
////
////  Created by Axel Remy on 20/06/2024.
////
//
//import SwiftUI
//
//struct FunFactDetail: View {
//    
////    var funfact: FactList
//    
//    var body: some View {
//        NavigationStack{
//            VStack{
//                Spacer()
//                Text("Infos")
//                    .bold()
//                    .font(.largeTitle)
//                Spacer()
//                Text(funfact.description)
//                    .font(.title2)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                Spacer()
//                ShareLink(item: String(funfact.description)) {
//                    VStack{
//                        Image(systemName: "square.and.arrow.up")
//                            .foregroundStyle(.black)
//                            .font(.largeTitle)
//                        Text("Partager")
//                            .foregroundStyle(.black)
//                            .font(.headline)
//                    }
//                }
//                Spacer()
//            }
//            .navigationTitle(funfact.titre)
//            .toolbarBackground(.greeny, for: .navigationBar)
//            .toolbarBackground(.visible, for: .navigationBar)
//            .toolbar(content: {
//                ToolbarItem(placement: .topBarTrailing) {
//                    ProfilButton()
//                    
//                }
//            })
//        }
//    }
//}
//
////#Preview {
////    FunFactDetail(funfact: recyclages.first!)
////}
