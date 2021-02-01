//
//  MarvelError.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//

import Foundation

/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
enum MarvelError: Error {
    case encoding
    case decoding
    case server(message: String)
}
