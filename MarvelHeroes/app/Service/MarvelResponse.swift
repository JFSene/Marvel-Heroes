//
//  MarvelResponse.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//

import Foundation

/// Top level response for every request to the Marvel API
/// Everything in the API seems to be optional, so we cannot rely on having values here
struct MarvelResponse<Response: Decodable>: Decodable {
    /// Whether it was ok or not
    let status: String?
    /// Message that usually gives more information about some error
    let message: String?
    /// Requested data
    let data: DataContainer<Response>?
}
