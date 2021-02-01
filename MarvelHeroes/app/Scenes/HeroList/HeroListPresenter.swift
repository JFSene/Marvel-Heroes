//
//  HeroListPresenter.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroListPresentationLogic {
    func presentSomething(response: HeroList.Models.Response)
}

class HeroListPresenter {
    private weak var viewController: HeroListDisplayLogic?
    
    init(viewController: HeroListDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - HeroListPresentationLogic
extension HeroListPresenter: HeroListPresentationLogic {
    // MARK: PresentSomething
    func presentSomething(response: HeroList.Models.Response) {
        let viewModel = HeroList.Models.Response(heroList: response.heroList)
        viewController?.displaySomething(viewModel: viewModel)
    }
}
