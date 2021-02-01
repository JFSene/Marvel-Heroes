//
//  HeroListWorker.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroListWorkerRepresentable {
    func doHero(result: @escaping(Result<HeroArray, Error>) -> Void)
}

enum HeroListWorkerError: Error {
    case showMessage(message: String)
    case systemUnavailable
    
    var localizedDescription: String {
        switch self {
        case .showMessage(let message):
            return message
        case .systemUnavailable:
            return "Desculpe, sistema indisponível."
        }
    }
}

class HeroListWorker: HeroListWorkerRepresentable {
    func doHero(result: @escaping (Result<HeroArray, Error>) -> Void) {
       
    }
    
    
}
