//
//  HeroListViewController.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroListDisplayLogic: class {
    func displaySomething(viewModel: HeroList.Something.ViewModel)
}

class HeroListViewController: UIViewController {
    //MARK: - Properties
    private var interactor: HeroListBusinessLogic?
    private var router: HeroListRouterRepresentable?
        
//    // MARK: - Init
//    @available(*, unavailable)
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("This method is not allowed")
//    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        doSomething()
    }
    
    // MARK: Configuration
    func configureInteractor(_ interactor: HeroListBusinessLogic) {
        self.interactor = interactor
    }
    
    func configureRouter(_ router: HeroListRouterRepresentable) {
        self.router = router
    }
    
    // MARK: View Setup
    private func setupView() {
        title = "HeroList"
        view.backgroundColor = .white
    }
    
    func doSomething() {
        let request = HeroList.Something.Request()
        interactor?.doSomething(request: request)
    }
}

// MARK: - HeroListDisplayLogic
extension HeroListViewController: HeroListDisplayLogic {
    func displaySomething(viewModel: HeroList.Something.ViewModel) {}
}
