//
//  HeroListInteractor.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroListBusinessLogic {
    func doHeroList(request: HeroList.Models.Request)
}

protocol HeroListDataStore {}

class HeroListInteractor: HeroListDataStore {
    private var presenter: HeroListPresentationLogic
    private var worker: HeroListWorkerRepresentable
    
    // MARK: - Life cycle
    init(presenter: HeroListPresentationLogic, worker: HeroListWorkerRepresentable) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: - HeroListBusinessLogic
extension HeroListInteractor: HeroListBusinessLogic {
    func doHeroList(request: HeroList.Models.Request) {
        worker.doHero { [weak self] (result) in
            switch result {
            case .success(let heroList):
                let model = HeroList.Models.Response(heroList: heroList)
                self?.presenter.presentSomething(response: model)
                print("Model: ", model.heroList)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                
            }
        }
    }
}
