//
//  NSObject+Extension.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 01/02/21.
//

import Foundation

extension NSObject {
    class func className() -> String {
        return String(describing: self)
    }
}
