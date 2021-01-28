//
//  HeroListInteractor.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroListBusinessLogic {
    func doSomething(request: HeroList.Something.Request)
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
    func doSomething(request: HeroList.Something.Request) {
        worker.doSomeWork()
        
        let response = HeroList.Something.Response()
        presenter.presentSomething(response: response)
    }
}
