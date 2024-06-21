//
//  Models.swift
//  GreenQuiz
//
//  Created by Axel Remy on 20/06/2024.
//

import Foundation


struct Theme: Identifiable {
    
    let id = UUID()
    var theme: String
    var tImage: String
    var factLists: [FactList]
    
}


struct FactList: Identifiable {
    var id = UUID()
    var theme: String
    var titre: String
    var description: String
    
    init(id: UUID = UUID(), theme: String, titre: String, description: String) {
        self.id = id
        self.theme = theme
        self.titre = titre
        self.description = description
        
    }
}
