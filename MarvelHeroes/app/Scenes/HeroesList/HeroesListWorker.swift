//
//  HeroesListWorker.swift
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

class HeroesListWorker
{
  func doHeroesList(result: @escaping(Result<HeroArray, Error>) -> Void)
  {
    let apiClient = MarvelAPIClient(publicKey: "650e801e1408159969078d2a1361c71c",
                                    privateKey: "20112b45612fd05f0d21d80d70bc8c971695c7f1")
    
    apiClient.send(GetHeroes()) { response in
        switch response {
        case .success(let heroes):
            let model = HeroArray(heroList: heroes.results)
            result(.success(model))
        case .failure(let error):
            result(.failure(error))
        }
    }
  }
}