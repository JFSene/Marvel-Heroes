//
//  HeroDetailsPresenter.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 01/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HeroDetailsPresentationLogic
{
  func presentHeroDetails(response: HeroDetails.Hero.Response)
}

class HeroDetailsPresenter: HeroDetailsPresentationLogic
{
  weak var viewController: HeroDetailsDisplayLogic?
  
  // MARK: Do something
  
  func presentHeroDetails(response: HeroDetails.Hero.Response)
  {
    let viewModel = HeroDetails.Hero.ViewModel(hero: response.hero)
    viewController?.displayHeroDetails(viewModel: viewModel)
  }
}
