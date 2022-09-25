//
//  HomeVC.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var btnMyPokemon: UIButton!
    @IBOutlet weak var btnPokemonList: UIButton!
    
    var presenter: VTPHomeProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupView(){
        btnMyPokemon.addTarget(self, action: #selector(onTapMyPokemon), for: .touchUpInside)
        btnPokemonList.addTarget(self, action: #selector(onTapPokemonList), for: .touchUpInside)
    }
    
    @objc func onTapMyPokemon(){
        if let navigation = self.navigationController{
            self.presenter?.gotoMyPokemonPage(nav: navigation)
        }
    }
    
    @objc func onTapPokemonList(){
        if let navigation = self.navigationController{
            self.presenter?.gotoPokemonList(nav: navigation)
        }
    }


}

extension HomeVC: PTVHomeProtocol{
    
}
