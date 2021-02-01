//
//  ImageURL.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//

import Foundation

/// Common object for images coming from the Marvel API
/// Shows how to fully conform to Decodable
struct ImageURL: Decodable {
    /// Server sends the remote URL splits in two: the path and the extension
    enum ImageKeys: String, CodingKey {
        case path = "path"
        case fileExtension = "extension"
    }

    /// The remote URL for this image
    let url: URL
    let hqURL: URL
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ImageKeys.self)

        let path = try container.decode(String.self, forKey: .path)
        let fileExtension = try container.decode(String.self, forKey: .fileExtension)

        guard let url = URL(string: "\(path)/portrait_small.\(fileExtension)") else { throw MarvelError.decoding }
        guard let urlXLarge = URL(string: "\(path)/portrait_uncanny.\(fileExtension)") else { throw MarvelError.decoding }
        
        self.url = url
        self.hqURL = urlXLarge
    }
}
