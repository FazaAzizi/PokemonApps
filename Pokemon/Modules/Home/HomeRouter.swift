//
//  HomeRouter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class HomeRouter: PTRHomeProtocol{
    static func createModuleHome() -> HomeVC {
        let view = HomeVC()
        let presenter = HomePresenter()
        let interactor: PTIHomeProtocol = HomeInteractor()
        let router:PTRHomeProtocol = HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func pushToMyPokemonPage(nav: UINavigationController) {
        let vc = MyPokemonRouter.createModuleMyPokemon()
        nav.pushViewController(vc, animated: true)
    }
    
    func pushToPokemonList(nav: UINavigationController) {
        let vc = PokemonListRouter.createModulePokemonList()
        nav.pushViewController(vc, animated: true)
    }
    
    
}
