//
//  HeroDetailsViewController.swift
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
import Kingfisher

protocol HeroDetailsDisplayLogic: class
{
    func displayHeroDetails(viewModel: HeroDetails.Hero.ViewModel)
}

class HeroDetailsViewController: UIViewController, HeroDetailsDisplayLogic
{
    var interactor: HeroDetailsBusinessLogic?
    var router: (NSObjectProtocol & HeroDetailsRoutingLogic & HeroDetailsDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        
        let presenter = HeroDetailsPresenter()
        let router = HeroDetailsRouter()
        let interactor = HeroDetailsInteractor()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    @IBAction func dismissButton(_ sender: Any) {
    }
    var heroDetails: HeroModel?
    
    func doSomething()
    {
        let request = HeroDetails.Hero.Request()
        interactor?.doHeroDetails(request: request)
    }
    
    func displayHeroDetails(viewModel: HeroDetails.Hero.ViewModel)
    {
        DispatchQueue.main.async {
            self.titleLabel.text = viewModel.hero?.name
            self.imgView.kf.setImage(with: viewModel.hero?.thumbnail?.hqURL)
            self.bioLabel.text = (viewModel.hero?.description!.isEmpty)! ? "No Bio Available" : viewModel.hero?.description
        }
    }
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}