//
//  PokemonDetailProtocol.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

protocol VTPPokemonDetailProtocol: AnyObject{
    var view: PTVPokemonDetailProtocol? {get set}
    var interactor: PTIPokemonDetailProtocol? {get set}
    var router: PTRPokemonDetailProtocol? {get set}
}

protocol PTVPokemonDetailProtocol: AnyObject{
    
}

protocol PTIPokemonDetailProtocol: AnyObject{
    var presenter:ITPPokemonDetailProtocol? {get set}
}

protocol ITPPokemonDetailProtocol: AnyObject{
    
}

protocol PTRPokemonDetailProtocol: AnyObject{
    static func createModulePokemonDetail()-> PokemonDetailVC
}
