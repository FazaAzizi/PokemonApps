//
//  HomePresenter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol{
    var view: PTVHomeProtocol?
    
    var interactor: PTIHomeProtocol?
    
    var router: PTRHomeProtocol?
    
    func gotoMyPokemonPage(nav: UINavigationController) {
        router?.pushToMyPokemonPage(nav: nav)
    }
    
    func gotoPokemonList(nav: UINavigationController) {
        router?.pushToPokemonList(nav: nav)
    }
    
    
}

extension HomePresenter: ITPHomeProtocol{
    
}
