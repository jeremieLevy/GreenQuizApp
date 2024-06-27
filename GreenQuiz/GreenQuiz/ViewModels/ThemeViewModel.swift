//
//  themeViewModel.swift
//  GreenQuiz
//
//  Created by Axel Remy on 20/06/2024.
//

import Foundation

@Observable
class ThemeViewModel {
    
    var themes = [Theme]()
    var isLoading = false
    
    private let apiUrl = "https://api.airtable.com/v0/app67AbJdEOEGwRUn/Theme"
    private let apiToken = "pat9xY5WUxKyReVg4.7bf897fef95bfc89b8a44554e3e14bc59611a5ae33690fe19ed4a5533ea57391"
    
    @MainActor
    func fetchThemes() async {
            
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
                let decodedData = try JSONDecoder().decode(ThemeResponse.self, from: data)
                
                // Mettre à jour l'état de la variable
                self.themes = decodedData.records
                
                // Mis à jour de l'état de chargement des données : les données sont complètement chargées et converties
                self.isLoading = false
                
            } catch {

                // Mis à jour de l'état de chargement des données : les données n'ont pas été chargées, fin de la requête
                self.isLoading = false
                
                print(error.localizedDescription)
                print(error)
            }
        }
}
