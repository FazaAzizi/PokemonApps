//
//  PokemonListCell.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit

class PokemonListCell: UITableViewCell {

    @IBOutlet weak var wrapView: UIView!
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!
    
    static let identifier = "PokemonListCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblName.text = ""
        lblType.text = ""
        imagePokemon.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
