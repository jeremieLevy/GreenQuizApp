//
//  AssetsModel.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import Foundation

@Observable
class AssetViewModel {
    var assets = [AssetModel]()
    var isLoading = false
    
    
    private let apiUrl = "https://api.airtable.com/v0/app67AbJdEOEGwRUn/Asset?view=Grid%20view"
    private let apiToken = "pat9xY5WUxKyReVg4.7bf897fef95bfc89b8a44554e3e14bc59611a5ae33690fe19ed4a5533ea57391"
    

    
    @MainActor
    func fetchAssets() async {

        let url = URL(string: apiUrl)!
        var request = URLRequest(url: url)
        
        request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
        
        isLoading = true
        
        do {
            
            let (data, _) = try await URLSession.shared.data(for: request)
            print("URLSession ok")
             
            let decodedData = try JSONDecoder().decode(AssetsResponse.self, from: data)
            print("JSONdecode ok")

            self.assets = decodedData.records
            print(decodedData.records[0])
            
            self.isLoading = false
            
        } catch {
            
            self.isLoading = false
            
            print(error.localizedDescription)
            print(error)
        }
    }
}

