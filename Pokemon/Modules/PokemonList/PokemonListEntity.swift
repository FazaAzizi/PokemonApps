//
//  PokemonListEntity.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import SwiftyJSON

struct PokemonListModel{
    var name: String?
    var url: String?
    
    init(){}
    
    init(_ json: JSON){
        name = json["name"].stringValue
        url = json["url"].stringValue
    }
}
