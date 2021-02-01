//
//  HeroListFactory.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

public struct HeroListFactory {
    private init() {}
    
    public static func makeController() -> UIViewController {
        let viewController = HeroListViewController()
        let presenter = HeroListPresenter(viewController: viewController)
        let worker = HeroListWorker()
        let interactor = HeroListInteractor(presenter: presenter, worker: worker)
        viewController.configureInteractor(interactor)
        let router = HeroListRouter(viewController: viewController)
        router.dataStore = interactor
        viewController.configureRouter(router)
        return viewController
    }
}
