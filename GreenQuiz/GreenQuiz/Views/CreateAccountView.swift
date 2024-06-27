//
//  CreateAccountView.swift
//  GreenQuiz
//
//  Created by Axel Remy on 26/06/2024.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var email = ""
    @State private var password = ""
    @State var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.greeny
                    .ignoresSafeArea()
                VStack{
                    Image("LogoAccueil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding()
                    
                    Text("Inscription")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                    
                    Text("E-mail")
                        .foregroundStyle(.white)

                    Spacer()
                        .frame(height: 30)
                    
                    TextField("E-mail", text: $email)
                        .padding(5)
                        .background(Color.white.opacity(1))
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.horizontal, 50)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("Mot de passe")
                        .foregroundStyle(.white)
                    
                    SecureField("Password", text: $password)
                        .padding(5)
                        .background(Color.white.opacity(1))
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.horizontal, 50)
                    Spacer()
                        .frame(height: 30)
                    
                    Button(action: {
                        Task {
                            await userViewModel.createUsers(email: email, password: password)
                        }
                    }) {
                        Text("valider inscription")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 25))
                    }
                    Spacer()
                        .frame(height: 85)
                    
                    
                }
                Spacer()
            }
            
        }
        
    }
}
#Preview {
    CreateAccountView()
}
