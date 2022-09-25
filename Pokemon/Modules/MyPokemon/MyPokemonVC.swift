//
//  MyPokemonVC.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit

class MyPokemonVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolbar: ToolbarView!
    
    var presenter: VTPMyPokemonProtocol?
    var savePokemon: [PokemonDetailModel] = []
    let publicCache = PublicCache.shared

    
    var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        savePokemon = self.publicCache.myPokemon[CacheKey.myPokemon.key()] ?? [PokemonDetailModel]()
        tableView.reloadData()
    }
    
    func setupView(){
        toolbar.setToolbar(title: "My Pokemon")
        toolbar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        tableView.register(PokemonListCell.nib(), forCellReuseIdentifier: PokemonListCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }

}

extension MyPokemonVC:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savePokemon.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListCell.identifier, for: indexPath) as! PokemonListCell
        
        cell.wrapView.setBackground(type: savePokemon[row].type[0].name ?? "")
        
        if let img = savePokemon[row].image{
            let url = URL(string: "\(img)")
            cell.imagePokemon.kf.setImage(with: url)
        }
        
        cell.lblName.text = savePokemon[row].name
        
        for i in 0..<savePokemon[row].type.count{
            if i == 0{
                type = savePokemon[row].type[i].name ?? ""
            }else{
                type = type + ", " + (savePokemon[row].type[i].name ?? "")
            }
        }
        cell.lblType.text = self.type
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigation = self.navigationController{
            self.presenter?.gotoPokemonDetail(data: savePokemon[indexPath.row], nav: navigation)
        }
    }
}

extension MyPokemonVC: ToolbarViewDelegate{
    func pressBack() {
        if let navigation = self.navigationController{
            navigation.popViewController(animated: false)
        }
    }
}


extension MyPokemonVC: PTVMyPokemonProtocol{
    
}
