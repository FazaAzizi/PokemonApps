//
//  PokemonDetailPresenter.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

class PokemonDetailPresenter: VTPPokemonDetailProtocol{
    var view: PTVPokemonDetailProtocol?
    
    var interactor: PTIPokemonDetailProtocol?
    
    var router: PTRPokemonDetailProtocol?
    
    
}

extension PokemonDetailPresenter: ITPPokemonDetailProtocol{
    
}
