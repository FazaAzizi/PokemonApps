//
//  PokemonAbilitiesCell.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit

class PokemonAbilitiesCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStat: UILabel!
    
    static let identifier = "PokemonAbilitiesCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblName.text = ""
        lblStat.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
