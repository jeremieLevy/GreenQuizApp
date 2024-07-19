//
//  GardenViewModel.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 01/07/2024.
//

import Foundation

@Observable
class GardenViewModel {
    
    var gardenName = ""
    
    init(gardenName: String = "") {
        self.gardenName = gardenName
    }
}
