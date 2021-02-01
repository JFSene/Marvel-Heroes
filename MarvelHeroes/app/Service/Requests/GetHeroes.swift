//
//  GetHeroes.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//

import Foundation

struct GetHeroes: APIRequest {
    typealias Response = [HeroModel]

    var resourceName: String {
        return "characters"
    }

    // Parameters
    let name: String?
    let nameStartsWith: String?
    let description: String?
    let limit: Int?
    let offset: Int?

    // Note that nil parameters will not be used
    init(name: String? = nil,
                nameStartsWith: String? = nil,
                description: String? = nil,
                limit: Int? = nil,
                offset: Int? = nil) {
        self.name = name
        self.nameStartsWith = nameStartsWith
        self.description = description
        self.limit = limit
        self.offset = offset
    }
}
