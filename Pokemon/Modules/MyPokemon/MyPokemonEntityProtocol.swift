//
//  MyPokemonEntityProtocol.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

protocol VTPMyPokemonProtocol: AnyObject{
    var view: PTVMyPokemonProtocol? {get set}
    var interactor: PTIMyPokemonProtocol? {get set}
    var router: PTRMyPokemonProtocol? {get set}
    
    func gotoPokemonDetail(data: PokemonDetailModel,nav: UINavigationController)
}

protocol PTVMyPokemonProtocol: AnyObject{
    
}

protocol PTIMyPokemonProtocol: AnyObject{
    var presenter:ITPMyPokemonProtocol? {get set}
}

protocol ITPMyPokemonProtocol: AnyObject{
    
}

protocol PTRMyPokemonProtocol: AnyObject{
    static func createModuleMyPokemon()-> MyPokemonVC
    func pushToPokemonDetail(data: PokemonDetailModel, nav: UINavigationController)
}
