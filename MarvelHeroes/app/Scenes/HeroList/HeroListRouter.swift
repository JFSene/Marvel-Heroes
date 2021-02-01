//
//  HeroListRouter.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroListRoutingLogic {
    //func routeToSomewhere()
}

protocol HeroListDataPassing {
    var dataStore: HeroListDataStore? { get }
}

typealias HeroListRouterRepresentable = HeroListRoutingLogic & HeroListDataPassing

class HeroListRouter: NSObject, HeroListDataPassing {
    private weak var viewController: HeroListViewController?
    var dataStore: HeroListDataStore?
        
    init(viewController: HeroListViewController) {
        self.viewController = viewController
    }
}

// MARK: HeroListRoutingLogic
extension HeroListRouter: HeroListRoutingLogic {}
