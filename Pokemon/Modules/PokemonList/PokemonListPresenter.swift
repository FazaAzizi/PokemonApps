//
//  PokemonListPresenter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class PokemonListPresenter: VTPPokemonListProtocol{
    var view: PTVPokemonListProtocol?
    
    var interactor: PTIPokemonListProtocol?
    
    var router: PTRPokemonListProtocol?
    
    func gotoPokemonDetail(data: PokemonDetailModel, nav: UINavigationController) {
        router?.pushToPokemonDetail(data: data, nav: nav)
    }
    
    func startFetchPokemonList(url: String) {
        interactor?.fetchPokemonList(url: url)
    }
    
    
}

extension PokemonListPresenter: ITPPokemonListProtocol{
    func onSuccessFetchPokemonList(data: [PokemonDetailModel], url: String) {
        view?.showPokemonList(data: data, url: url)
    }
    
    func onFailedFetchPokemonList(message: String) {
        view?.showError(message: message)
    }
    
    
}
