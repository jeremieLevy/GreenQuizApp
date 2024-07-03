//
//  profilView.swift
//  GreenQuiz
//
//  Created by Apprenant 106 on 19/06/2024.
//

import SwiftUI

struct ProfilView: View {
    
    @State var percent: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
                ZStack {
                    Rectangle()
                        .fill(Color.greeny)
                    //Oui je sais que c'est un vert dégueulasse mais on a toujours pas mis de code couleur :(
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Image("dog")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(5)
                        Text("Jean_Mimi")
                            .foregroundStyle(.white)
                            .font(.system(size : 30, weight: .bold))
                        
                        HStack {
                            // ce qui est en com c'est pour mettre en mode "normal" d'utilisation avec plus tard le branchement à faire aussi avec les données de l'utilisateur selon l'XP récolté, là c'est juste pour illustrer
                            //Text("\(Int(percent))%")
                            Text("lvl 4")
                                .font(.system(size : 20, weight: .bold))
                                .foregroundStyle(.white)
                            //progressionBar(width: 200, height: 20, percent: percent, color1: .red, color2: .blue)
                            ProgressionBar(width: 200, height: 20, percent: 70, color1: .red, color2: .blue)
                                .padding(20)
                            
                            Text("70%")
                                .font(.system(size : 20, weight: .bold))
                                .foregroundStyle(.white)
                        }

                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white)
                                .frame(width: 300, height: 50)
                                .padding(20)
                            Text("Nombre de quiz accomplies : 8")
                                .foregroundStyle(.black)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white)
                                .frame(width: 300, height: 50)
                                .padding(20)
                            Text("Meilleure score : 32")
                                .foregroundStyle(.black)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white)
                                .frame(width: 300, height: 50)
                                .padding(20)
                            Text("Classement : 1er")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
        }
    }

#Preview {
    ProfilView()
}
