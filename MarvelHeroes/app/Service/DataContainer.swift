//
//  DataContainer.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//

import Foundation

/// All successful responses return this, and contains all
/// the metainformation about the returned chunk.
struct DataContainer<Results: Decodable>: Decodable {
    public let offset: Int
    public let limit: Int
    public let total: Int
    public let count: Int
    public let results: Results
}
