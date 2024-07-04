//
//  LoginViewModel.swift
//  GreenQuiz
//
//  Created by Axel Remy on 25/06/2024.
//

import Foundation

@Observable
class UserViewModel {
    var users = [User]()
    var isLoading = false
    var isLoging = true
    
    
    
    private let apiUrl = "https://api.airtable.com/v0/app67AbJdEOEGwRUn/User?view=Grid%20view"
    private let apiToken = "pat9xY5WUxKyReVg4.7bf897fef95bfc89b8a44554e3e14bc59611a5ae33690fe19ed4a5533ea57391"
    

    func checkUser(email: String, password: String) async{
         
        let query = "filterByFormula=FIND('\(email)', {email})".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
            
            // Objet URL pour la requête
            let url = URL(string: "https://api.airtable.com/v0/app67AbJdEOEGwRUn/User?\(query)")!
            
            // Objet requête contenant des en-têtes ou d'autres métadonnées
            var request = URLRequest(url: url)
            request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
            
            // Mis à jour de l'état de chargement des données : les données sont en cours de chargement
            isLoading = true
            
            do {
                
                // Tentative d'exécution de la requête vers l'API
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Décodage ou conversion des données reçues au format CountriesResponse
                let decodedData = try JSONDecoder().decode(UsersResponse.self, from: data)
                // Mettre à jour l'état de la variable
                let result = decodedData.records
                
                DispatchQueue.main.async {
                    if !result.isEmpty && password == result[0].fields.password{
                        self.isLoging = false
                        print(self.isLoging)
                    }
                }
                
                // Mis à jour de l'état de chargement des données : les données sont complètement chargées et converties
                self.isLoading = false
                
            } catch {
                
                // Mis à jour de l'état de chargement des données : les données n'ont pas été chargées, fin de la requête
                self.isLoading = false
                
                print(error.localizedDescription)
//                print(error)
            }
        }
    
    @MainActor
    func fetchUsers() async {
            
            // Objet URL pour la requête
            let url = URL(string: apiUrl)!
            
            // Objet requête contenant des en-têtes ou d'autres métadonnées
            var request = URLRequest(url: url)
            request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
            
            // Mis à jour de l'état de chargement des données : les données sont en cours de chargement
            isLoading = true
            
            do {
                
                // Tentative d'exécution de la requête vers l'API
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Décodage ou conversion des données reçues au format CountriesResponse
                let decodedData = try JSONDecoder().decode(UsersResponse.self, from: data)
                // Mettre à jour l'état de la variable
                self.users = decodedData.records
                
                // Mis à jour de l'état de chargement des données : les données sont complètement chargées et converties
                self.isLoading = false
                
            } catch {
                
                // Mis à jour de l'état de chargement des données : les données n'ont pas été chargées, fin de la requête
                self.isLoading = false
                
                print(error.localizedDescription)
//                print(error)
            }
        }
    func createUsers(email: String, password: String) async {
        
        let url = URL(string: apiUrl)!
        
        let jsonObject: [String: Any] = [
            "fields": [
                "email": email,
                "password": password
            ]
        ]
        
        do {
            let userData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
            print("serie terminer")
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = userData
            
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
              }
              print(String(data: data, encoding: .utf8)!)
            }

            task.resume()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
