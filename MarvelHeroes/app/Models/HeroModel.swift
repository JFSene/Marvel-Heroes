//
//  HeroModel.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//

import Foundation

struct HeroModel: Decodable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: ImageURL?
}

struct HeroArray: Decodable {
    let heroList: [HeroModel?]
}
