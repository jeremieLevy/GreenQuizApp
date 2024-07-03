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
    @Binding var showLogin: Bool
    
    
    func fetchUsers() {
        Task{
            await viewModel.fetchUsers()
        }
    }
    
    func checkUser(email: String, password: String) {
        Task{
            await viewModel.checkhUser(email: email, password: password)
        }
    }
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
                    
                    Text("Connexion")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                    
                    Text("E-mail")
                        .foregroundStyle(.white)
                    
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
                    
//                    Button(action: {
//                        // oublie de password
//                    }, label: {
//                        Text("Mot de passe oublié ?")
//                            .foregroundStyle(.white)
//                            .font(.footnote)
//                            .padding(5)
//                    })
                    
                    Spacer()
                        .frame(height: 30)
                    
                        Button(action: {
                           checkUser(email: email, password: password)
                            DispatchQueue.global().async{
                                Thread.sleep(forTimeInterval: 0.8)
                                if !viewModel.isLoging{
                                    showLogin = false
                                    print("connexion ok")
                                }else{
                                    print("pas co")
                                }
                            }
                            
                            
//                            fetchUsers()
//                            if !viewModel.users.isEmpty {
//                            for user in viewModel.users {
//                                if user.fields.email.lowercased() == email.lowercased() && user.fields.password == password {
//                                    print("connexion ok")
//                                    isConnected.toggle()
//                                    return
//                                }
//                            }
//                        }else {
//                            }
//                    
//                        print("Échec de la connexion.")
                            
                        }, label: {
                            Text("Se connecter")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color.black.opacity(0.3))
                                .clipShape(.rect(cornerRadius: 25))
                            })
                    
                    NavigationLink {
                        CreateAccountView()
                    } label: {
                        Text("Créer votre compte")
                            .foregroundStyle(.white)
                            .padding()
                    }
                    
                    Spacer()

                }
            }
        }
    }
}

#Preview {
    LoginView(showLogin: .constant(true))
}
