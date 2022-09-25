//
//  PokemonListVC.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit
import Foundation
import Kingfisher

class PokemonListVC: UIViewController {

    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolbar: ToolbarView!
    
    var presenter: VTPPokemonListProtocol?
    
    var dataPokemon: [PokemonDetailModel] = []
    var url = "https://pokeapi.co/api/v2/pokemon/"
    var type = ""
    var isCanNext = true
    var isNext = false

    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner()
        setupView()
        self.presenter?.startFetchPokemonList(url: url)
    }
    
    func setupView(){
        toolbar.setToolbar(title: "List Pokemon")
        toolbar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        tableView.register(PokemonListCell.nib(), forCellReuseIdentifier: PokemonListCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    private func showSpinner() {
        indicatorActivity.isHidden = false
        indicatorActivity.startAnimating()
    }

    private func hideSpinner() {
        indicatorActivity.isHidden = true
        indicatorActivity.stopAnimating()
    }
}


extension PokemonListVC:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPokemon.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListCell.identifier, for: indexPath) as! PokemonListCell
        
        cell.wrapView.setBackground(type: dataPokemon[row].type[0].name ?? "")
        
        if let img = dataPokemon[row].image{
            let url = URL(string: "\(img)")
            cell.imagePokemon.kf.setImage(with: url)
        }
        
        cell.lblName.text = dataPokemon[row].name
        
        for i in 0..<dataPokemon[row].type.count{
            if i == 0{
                type = dataPokemon[row].type[i].name ?? ""
            }else{
                type = type + ", " + (dataPokemon[row].type[i].name ?? "")
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
            self.presenter?.gotoPokemonDetail(data: dataPokemon[indexPath.row], nav: navigation)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 10.0 {
            if isCanNext{
                showSpinner()
                isNext = true
                self.presenter?.startFetchPokemonList(url: url)
            }
        }
    }
}

extension PokemonListVC: ToolbarViewDelegate{
    func pressBack() {
        if let navigation = self.navigationController{
            navigation.popViewController(animated: false)
        }
    }
}

extension PokemonListVC: PTVPokemonListProtocol{
    func showPokemonList(data: [PokemonDetailModel], url: String) {
        hideSpinner()
        if url == ""{
            isCanNext = false
        }
        
        if isNext{
            self.dataPokemon.append(contentsOf: data)
        }else{
            self.dataPokemon = data
        }
        self.url = url
        self.tableView.reloadData()
    }
    
    func showError(message: String) {
        
    }
    
    
}
