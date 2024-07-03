//
//  parametreView.swift
//  GreenQuiz
//
//  Created by Apprenant 106 on 20/06/2024.
//

import SwiftUI

struct ParametreView: View {
    
    @State private var showGreeting = true
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.greeny)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 50)
                    Toggle("Recevoir les notifications", isOn: $showGreeting)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 50)
                    Button(action: {
                        self.alertMessage = "Voulez-vous modifier votre mot de passe ?"
                        self.showAlert.toggle()
                    }) {
                        HStack {
                            Text("Modifier votre mot de passe")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 50)
                    Button(action: {
                        self.alertMessage = "Voulez-vous modifier votre mail ?"
                        self.showAlert.toggle()
                    }) {
                        HStack {
                            Text("Modifier votre mail")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 50)
                    Button(action: {
                        self.alertMessage = "Voulez-vous modifier votre numéro de téléphone ?"
                        self.showAlert.toggle()
                    }) {
                        HStack {
                            Text("Modifier votre numéro de téléphone")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 50)
                    Button(action: {
                        self.alertMessage = "Voulez-vous modifier votre photo de profil ?"
                        self.showAlert.toggle()
                    }) {
                        HStack {
                            Text("Modifier votre photo de profil")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 50)
                    Button(action: {
                        self.alertMessage = "Êtes-vous sûr de vouloir vous déconnecter ?"
                        self.showAlert.toggle()
                    }) {
                        HStack {
                            Text("Déconnexion")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.red)
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 50)
                    Button(action: {
                        self.alertMessage = "Êtes-vous sûr de vouloir supprimer votre compte :( ?"
                        self.showAlert.toggle()
                    }) {
                        HStack {
                            Text("Supprimer votre compte")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.red)
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Paramètres"), message: Text(alertMessage), primaryButton: .default(Text("Oui")), secondaryButton: .cancel(Text("Non")))
            })
        }
    }
}

struct parametre_Previews: PreviewProvider {
    static var previews: some View {
        ParametreView()
    }
}
