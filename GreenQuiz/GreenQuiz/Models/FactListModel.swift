//
//  FactListModel.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 21/06/2024.
//

import Foundation

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
