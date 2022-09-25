//
//  PokemonListRouter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class PokemonListRouter: PTRPokemonListProtocol{
    static func createModulePokemonList() -> PokemonListVC {
        let view = PokemonListVC()
        let presenter = PokemonListPresenter()
        let interactor: PTIPokemonListProtocol = PokemonListInteractor()
        let router:PTRPokemonListProtocol = PokemonListRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func pushToPokemonDetail(data: PokemonDetailModel, nav: UINavigationController) {
        let vc = PokemonDetailRouter.createModulePokemonDetail()
        vc.data = data
        nav.pushViewController(vc, animated: true)
    }
    
    
}

