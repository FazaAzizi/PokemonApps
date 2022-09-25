//
//  MyPokemonPresenter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class MyPokemonPresenter: VTPMyPokemonProtocol{
    var view: PTVMyPokemonProtocol?
    
    var interactor: PTIMyPokemonProtocol?
    
    var router: PTRMyPokemonProtocol?
    
    func gotoPokemonDetail(data: PokemonDetailModel, nav: UINavigationController) {
        router?.pushToPokemonDetail(data: data, nav: nav)
    }
    
    
}

extension MyPokemonPresenter: ITPMyPokemonProtocol{
    
}
