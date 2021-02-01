//
//  HeroesListInteractor.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 29/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HeroesListBusinessLogic
{
  func doHeroesList(request: HeroesList.Models.Request)
}

protocol HeroesListDataStore
{
  //var name: String { get set }
}

class HeroesListInteractor: HeroesListBusinessLogic, HeroesListDataStore
{
  var presenter: HeroesListPresentationLogic?
  var worker: HeroesListWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doHeroesList(request: HeroesList.Models.Request)
  {
    worker = HeroesListWorker()
    worker?.doHeroesList { [weak self] (result) in
        switch result {
        case .success(let heroesList):
            DispatchQueue.main.async {
                let model = HeroList.Models.Response(heroList: heroesList)
                print(model.heroList)
    //            self?.presenter?.presentHeroesList(response: model)
    //            self?.presenter?.presentHeroesList(response: model)
                print("Model: ", model.heroList)
            }
        case .failure(let error):
            debugPrint(error.localizedDescription)
        }
    }
  }
}
