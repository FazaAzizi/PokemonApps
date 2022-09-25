//
//  PokemonDetailRouter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class PokemonDetailRouter: PTRPokemonDetailProtocol{
    static func createModulePokemonDetail() -> PokemonDetailVC {
        let view = PokemonDetailVC()
        let presenter = PokemonDetailPresenter()
        let interactor: PTIPokemonDetailProtocol = PokemonDetailInteractor()
        let router:PTRPokemonDetailProtocol = PokemonDetailRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    
}
