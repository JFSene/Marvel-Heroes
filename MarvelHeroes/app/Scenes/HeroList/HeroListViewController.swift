//
//  HeroListViewController.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 28/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroListDisplayLogic: class {
    func displaySomething(viewModel: HeroList.Models.Response)
}

class HeroListViewController: UIViewController {
    //MARK: - Properties
    private var interactor: HeroListBusinessLogic?
    private var router: HeroListRouterRepresentable?
        
    
    // MARK: View lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadList()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.getHeroes()
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
        loadList()
    }
    func loadList() {
        let request = HeroList.Models.Request()
        interactor?.doHeroList(request: request)
    }
    
    func getHeroes() {
        let apiClient = MarvelAPIClient(publicKey: "650e801e1408159969078d2a1361c71c",
                                        privateKey: "20112b45612fd05f0d21d80d70bc8c971695c7f1")
        apiClient.send(GetHeroes()) { [weak self] response in
            print("\nGetCharacters finished:")

            response.map { dataContainer in
                for character in dataContainer.results {
                    print("  Title: \(character.name ?? "Unnamed character")")
                    print("  Thumbnail: \(character.thumbnail?.url.absoluteString ?? "None")")
                    print("  description: \(character.description ?? "None")")
                }
            }
        }
    }
    
   
       
}

// MARK: - HeroListDisplayLogic
extension HeroListViewController: HeroListDisplayLogic {
    func displaySomething(viewModel: HeroList.Models.Response) {
        print(viewModel.heroList)
    }
}
