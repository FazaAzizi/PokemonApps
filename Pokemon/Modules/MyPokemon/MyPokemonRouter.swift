//
//  MyPokemonRouter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class MyPokemonRouter: PTRMyPokemonProtocol{
    static func createModuleMyPokemon() -> MyPokemonVC {
        let view = MyPokemonVC()
        let presenter = MyPokemonPresenter()
        let interactor: PTIMyPokemonProtocol = MyPokemonInteractor()
        let router:PTRMyPokemonProtocol = MyPokemonRouter()
        
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
        vc.typeNav = 1
        vc.titleToolbar = data.saveName ?? ""
        nav.pushViewController(vc, animated: true)
    }
    
    
}
