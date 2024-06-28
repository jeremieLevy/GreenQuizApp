//
//  AssetsData.swift
//  GreenQuiz
//
//  Created by Jérémie Levy on 19/06/2024.
//

import Foundation
struct AssetsResponse: Decodable {
    let records: [AssetModel]
}

struct AssetModel: Decodable, Identifiable {
    let id: String
    let fields: AssetFields
}

struct AssetFields: Decodable {
    let name: String
    let image: [Plant]
}

struct Plant: Decodable {
    let url: String
}
