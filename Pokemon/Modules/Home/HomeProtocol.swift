//
//  HomeProtocol.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

protocol VTPHomeProtocol: AnyObject{
    var view: PTVHomeProtocol? {get set}
    var interactor: PTIHomeProtocol? {get set}
    var router: PTRHomeProtocol? {get set}
    
    func gotoMyPokemonPage(nav: UINavigationController)
    func gotoPokemonList(nav: UINavigationController)
}

protocol PTVHomeProtocol: AnyObject{
    
}

protocol PTIHomeProtocol: AnyObject{
    var presenter:ITPHomeProtocol? {get set}
}

protocol ITPHomeProtocol: AnyObject{
    
}

protocol PTRHomeProtocol: AnyObject{
    static func createModuleHome()-> HomeVC
    func pushToMyPokemonPage(nav: UINavigationController)
    func pushToPokemonList(nav: UINavigationController)
}
