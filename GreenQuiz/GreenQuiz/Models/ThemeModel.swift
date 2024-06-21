//
//  Models.swift
//  GreenQuiz
//
//  Created by Axel Remy on 20/06/2024.
//

import Foundation


struct ThemeModel: Identifiable {
    
    let id = UUID()
    var theme: String
    var tImage: String
    var factLists: [FactList]
    
}
