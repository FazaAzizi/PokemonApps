//
//  PokemonListProtocol.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

protocol VTPPokemonListProtocol: AnyObject{
    var view: PTVPokemonListProtocol? {get set}
    var interactor: PTIPokemonListProtocol? {get set}
    var router: PTRPokemonListProtocol? {get set}
    
    func startFetchPokemonList(url: String)
    
    func gotoPokemonDetail(data: PokemonDetailModel,nav: UINavigationController)
}

protocol PTVPokemonListProtocol: AnyObject{
    func showPokemonList(data: [PokemonDetailModel], url: String)
    func showError(message: String)
}

protocol PTIPokemonListProtocol: AnyObject{
    var presenter:ITPPokemonListProtocol? {get set}
    func fetchPokemonList(url: String)
}

protocol ITPPokemonListProtocol: AnyObject{
    func onSuccessFetchPokemonList(data: [PokemonDetailModel], url: String)
    func onFailedFetchPokemonList(message: String)
}

protocol PTRPokemonListProtocol: AnyObject{
    static func createModulePokemonList()-> PokemonListVC
    func pushToPokemonDetail(data: PokemonDetailModel, nav: UINavigationController)

}
