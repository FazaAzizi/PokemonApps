//
//  PokemonDetailCollCell.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit

class PokemonDetailCollCell: UICollectionViewCell {

    @IBOutlet weak var wrapView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    static let identifier = "PokemonDetailCollCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.text = ""
    }

}
