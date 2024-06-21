//
//  AssetsModel.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import Foundation

class AssetsViewModel: ObservableObject {
    @Published var assets: [Asset] = [
        Asset(image: "Asset01", name: "Little Flower"),
        Asset(image: "Asset02", name: "Little Flower"),
        Asset(image: "Asset03", name: "Little Flower"),
        Asset(image: "Asset04", name: "Little Flower"),
        Asset(image: "Asset05", name: "Little Flower"),
        Asset(image: "Asset06", name: "Little Flower"),
        Asset(image: "Asset07", name: "Little Flower"),
        Asset(image: "Asset08", name: "Little Flower"),
        Asset(image: "Asset09", name: "Little Flower"),
        Asset(image: "Asset10", name: "Little Flower"),
        Asset(image: "Asset11", name: "Little Flower"),
    ]
    
    func getAllAssets() -> [Asset] {
        return assets
    }
}

