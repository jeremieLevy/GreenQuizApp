//
//  themeViewModel.swift
//  GreenQuiz
//
//  Created by Axel Remy on 20/06/2024.
//

import Foundation

@Observable
class ThemesViewModel {
    
    func getAllThemes() -> [ThemeModel]{
        
        return [
            ThemeModel(theme: "Recyclage", tImage: "recyclage", factLists: recyclages),
            ThemeModel(theme: "Impact Environnemental", tImage: "impact", factLists: impacts),
            ThemeModel(theme: "Eau", tImage: "eau", factLists: waters),
            ThemeModel(theme: "Maison", tImage: "home", factLists: homes),
            ThemeModel(theme: "Energies", tImage: "energies", factLists: waters),
            ThemeModel(theme: "Alimentation", tImage: "alimentation", factLists: waters)
            
        ]
    }
}
