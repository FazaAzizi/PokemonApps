//
//  ExtUIView.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

extension UIView{
    func setBackground(type: String){
        self.layer.cornerRadius = 10
        
        switch type{
        case "normal":
            self.backgroundColor = UIColor(hexaRGB: "#a8a77a")
        case "fighting":
            self.backgroundColor = UIColor(hexaRGB: "#c22e28")
        case "flying":
            self.backgroundColor = UIColor(hexaRGB: "#a98ef3")
        case "poison":
            self.backgroundColor = UIColor(hexaRGB: "#a33ea2")
        case "ground":
            self.backgroundColor = UIColor(hexaRGB: "#e1bf65")
        case "rock":
            self.backgroundColor = UIColor(hexaRGB: "#b7a134")
        case "bug":
            self.backgroundColor = UIColor(hexaRGB: "#725797")
        case "ghost":
            self.backgroundColor = UIColor(hexaRGB: "#735797")
        case "steel":
            self.backgroundColor = UIColor(hexaRGB: "#b8b7ce")
        case "fire":
            self.backgroundColor = UIColor(hexaRGB: "#ee8130")
        case "water":
            self.backgroundColor = UIColor(hexaRGB: "#6390f1")
        case "grass":
            self.backgroundColor = UIColor(hexaRGB: "#7bc74b")
        case "electric":
            self.backgroundColor = UIColor(hexaRGB: "#ffd870")
        case "psychic":
            self.backgroundColor = UIColor(hexaRGB: "#fa5587")
        case "ice":
            self.backgroundColor = UIColor(hexaRGB: "#97d9d6")
        case "dragon":
            self.backgroundColor = UIColor(hexaRGB: "#7035fc")
        case "dark":
            self.backgroundColor = UIColor(hexaRGB: "#705846")
        case "fairy":
            self.backgroundColor = UIColor(hexaRGB: "#d685ad")
        case "unknown":
            self.backgroundColor = UIColor(hexaRGB: "#335734")
        case "shadow":
            self.backgroundColor = UIColor(hexaRGB: "#474747")
        case "abi" :
            self.backgroundColor = UIColor(hexaRGB: "#eeeee4")
        default:
            self.backgroundColor = UIColor(hexaRGB: "#a8a77a")
        }
    }
}


extension UITableViewCell {
    func setTransparent() {
        let bgView: UIView = UIView()
        bgView.backgroundColor = UIColor.clear
        self.backgroundView = bgView
        self.backgroundColor = UIColor.clear
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.contentView.backgroundColor = UIColor.clear
    }
}
