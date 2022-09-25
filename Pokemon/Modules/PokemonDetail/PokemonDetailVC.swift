//
//  PokemonDetailVC.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit
import Foundation
import Kingfisher

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var toolbar: ToolbarView!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblPokemonName: UILabel!
    @IBOutlet weak var btnCatch: UIButton!
    @IBOutlet weak var collectionType: UICollectionView!
    @IBOutlet weak var tableStats: UITableView!
    @IBOutlet weak var collectionAbilities: UICollectionView!
    
    @IBOutlet weak var heightCollTyoe: NSLayoutConstraint!
    @IBOutlet weak var heightTableStat: NSLayoutConstraint!
    @IBOutlet weak var heightCollAbilities: NSLayoutConstraint!
    
    var presenter: VTPPokemonDetailProtocol?
    var data: PokemonDetailModel?
    var savePokemon: [PokemonDetailModel] = []
    var typeNav = 0
    var titleToolbar = "Detail Pokemon"
    let publicCache = PublicCache.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        savePokemon = self.publicCache.myPokemon[CacheKey.myPokemon.key()] ?? [PokemonDetailModel]()
    }
    
    func setupData(){
        collectionType.reloadData()
        collectionAbilities.reloadData()
        tableStats.reloadData()
        
        lblPokemonName.text = data?.name ?? ""
        if let img = data?.image{
            let url = URL(string: "\(img)")
            imgPokemon.kf.setImage(with: url )
        }
        
        let heightType:CGFloat = collectionType.collectionViewLayout.collectionViewContentSize.height
        heightCollTyoe.constant = heightType
        
        let heightAbility:CGFloat = collectionAbilities.collectionViewLayout.collectionViewContentSize.height
        heightCollAbilities.constant = heightAbility
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
        heightTableStat.constant = tableStats.contentSize.height
        
    }
    
    func setupView(){
        
        toolbar.setToolbar(title: titleToolbar)
        toolbar.delegate = self
        if typeNav == 0{
            btnCatch.addTarget(self, action: #selector(onCatch), for: .touchUpInside)
        }else{
            btnCatch.addTarget(self, action: #selector(onRelease), for: .touchUpInside)
            btnCatch.setTitle("Release", for: .normal)
        }
        let nib = PokemonDetailCollCell.nib()
        collectionType.register(nib, forCellWithReuseIdentifier: PokemonDetailCollCell.identifier)
        collectionType.delegate = self
        collectionType.dataSource = self
        collectionType.isScrollEnabled = false
        collectionType.backgroundColor = UIColor.white
        
        collectionAbilities.register(nib, forCellWithReuseIdentifier: PokemonDetailCollCell.identifier)
        collectionAbilities.delegate = self
        collectionAbilities.dataSource = self
        collectionAbilities.isScrollEnabled = false
        collectionAbilities.backgroundColor = UIColor.white
        
        tableStats.delegate = self
        tableStats.dataSource = self
        tableStats.allowsSelection = false
        tableStats.isScrollEnabled = false
        tableStats.register(PokemonAbilitiesCell.nib(), forCellReuseIdentifier: PokemonAbilitiesCell.identifier)
    }
    
    @objc func onRelease(){
        let alert = UIAlertController(title: "Pokemon", message: "Are you sure want to release this pokemon?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            let newSave = self.savePokemon.filter{$0.saveName != self.data?.saveName}
            self.publicCache.myPokemon[CacheKey.myPokemon.key()] = newSave
            if let navigation = self.navigationController{
                navigation.popViewController(animated: false)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func onCatch(){
        let alert = UIAlertController(title: "Pokemon", message: "Are you sure want to catch this pokemon?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            
            let random = Int(arc4random_uniform(100))
            
            if random < 50 {
                self.alertTextField()
            } else {
                self.showAlert(message: "Failed catch pokemon!")
            }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func alertTextField() {
        let alert = UIAlertController(title: "Great!", message: "Give this pokemon name?", preferredStyle: UIAlertController.Style.alert )
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            if textField.text != "" {
                var temp = self.data
                temp?.saveName = textField.text
                if let temp = temp {
                    self.savePokemon.append(temp)
                    self.publicCache.myPokemon[CacheKey.myPokemon.key()] = self.savePokemon
                    self.showAlert(message: "Catch success!")
                }
            } else {
                
            }
        }
        
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter name for pokemon"
            textField.textColor = .black
        }
        
        alert.addAction(save)
        
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        
        self.present(alert, animated:true, completion: nil)
    }
    
    func showAlert(message : String){
        let toastLabel = UILabel(frame: CGRect(x: 40, y: self.view.frame.size.height-100, width: self.view.frame.size.width - 80, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

extension PokemonDetailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.stat.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonAbilitiesCell.identifier, for: indexPath) as! PokemonAbilitiesCell
        
        cell.lblName.text = data?.stat[row].name ?? "" + " : "
        cell.lblStat.text = String(data?.stat[row].baseStat ?? 0)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension PokemonDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionType{
            return data?.type.count ?? 0
        }else{
            return data?.ability.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        if collectionView == collectionType{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonDetailCollCell.identifier, for: indexPath) as! PokemonDetailCollCell
            cell.lblTitle.text = data?.type[row].name
            cell.wrapView.setBackground(type: data?.type[row].name ?? "")
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonDetailCollCell.identifier, for: indexPath) as! PokemonDetailCollCell
            cell.lblTitle.text = data?.ability[row].name ?? ""
            cell.wrapView.setBackground(type: "abi")
            
            return cell
            
        }
    }
    
}

extension PokemonDetailVC: ToolbarViewDelegate{
    func pressBack() {
        if let navigation = self.navigationController{
            navigation.popViewController(animated: false)
        }
    }
}

extension PokemonDetailVC: PTVPokemonDetailProtocol{
    
}
