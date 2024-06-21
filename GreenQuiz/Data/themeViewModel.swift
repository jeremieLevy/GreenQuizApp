//
//  themeViewModel.swift
//  GreenQuiz
//
//  Created by Axel Remy on 20/06/2024.
//

import Foundation

@Observable
class ThemesViewModel {
    
    func getAllThemes() -> [Theme]{
        
        return [
            Theme(theme: "Recyclage", tImage: "recyclage", factLists: recyclages),
            Theme(theme: "Impact Environnemental", tImage: "impact", factLists: impacts),
            Theme(theme: "Eau", tImage: "eau", factLists: waters),
            Theme(theme: "Maison", tImage: "home", factLists: homes),
            Theme(theme: "Energies", tImage: "energies", factLists: waters),
            Theme(theme: "Alimentation", tImage: "alimentation", factLists: waters)
            
        ]
    }
}
