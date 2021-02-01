//
//  HeroListModels.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum HeroList {
    // MARK: Use cases
    enum Models {
        struct Request {}
        struct Response {
            var heroList: HeroArray
        }
        struct ViewModel {}
    }
}
