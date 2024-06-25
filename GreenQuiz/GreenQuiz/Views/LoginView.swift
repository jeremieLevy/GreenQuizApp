//
//  LoginView.swift
//  GreenQuiz
//
//  Created by Axel Remy on 25/06/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var viewModel = UserViewModel()
    
    @State private var email = ""
    @State private var password = ""
    
    
    func fetchUsers() {
        Task{
            await viewModel.fetchUsers()
        }
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.greeny
                    .ignoresSafeArea()
                VStack{
                    Image("home")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding()
                    
                    Text("Connexion")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                    
                    Text("E-mail")
                        .foregroundStyle(.white)
                    
                    TextField("E-mail", text: $email)
                        .textCase(.lowercase)
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
                    
                    Button(action: {
                        //password
                    }, label: {
                        Text("Forgot your password ?")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .padding(2)
                    })
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Button(action: {
                        fetchUsers()
                            if !viewModel.users.isEmpty {
                                for user in viewModel.users {
                                    if user.fields.mail.lowercased() == email.lowercased() && user.fields.password == password {
                                        print("Connexion réussie !")
                                        return
                                    }
                                }
                            }else {
                            }

                            print("Échec de la connexion.")
                    }, label: {
                        Text("Se connecter")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 25))
                        
                    })
                    
                    Button(action: {
                        //creation de compte
                    }, label: {
                        Text("Créer votre compte")
                            .foregroundStyle(.white)
                            .padding()
                    })
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
