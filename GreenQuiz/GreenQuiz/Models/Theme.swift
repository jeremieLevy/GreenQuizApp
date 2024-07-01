//  //
//  //  Models.swift
//  //  GreenQuiz
//  //
//  //  Created by Axel Remy on 20/06/2024.
//  //
//
import Foundation
//
struct ThemeResponse: Decodable {
  let records: [Theme]
}
  // themes
struct Theme: Decodable, Identifiable {
  let id: String
  let fields: ThemeFields
}

struct ThemeFields: Decodable {
    let theme: String
    //  let factList: [FactListModel]
    let picture: [Picture]
}

struct Picture: Decodable {
  let id: String
  let width: Int
  let height: Int
  let url: String
  let filename: String
  let size: Int
  let type: String
  let thumbnails: Thumbnails
}

struct Thumbnails: Decodable {
  let small: SmallImg
  let large: LargeImg
  let full: FullImg
}

struct SmallImg: Decodable {
  let url: String
  let width: Int
  let height: Int
}

struct LargeImg: Decodable {
  let url: String
  let width: Int
  let height: Int
}

struct FullImg: Decodable {
  let url: String
  let width: Int
  let height: Int
}
