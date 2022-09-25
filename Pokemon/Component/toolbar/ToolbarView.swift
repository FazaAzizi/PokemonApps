//
//  toolbarView.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import Foundation
import UIKit

protocol ToolbarViewDelegate {
    func pressBack()
}

@IBDesignable
class ToolbarView: UIView{
    
    @IBOutlet weak var lblToolbar: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    var delegate: ToolbarViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    
    
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "ToolbarView") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        self.btnBack.addTarget(self, action: #selector(btnBackTap), for: .touchUpInside)
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setToolbar (title: String){
        self.lblToolbar.text = title
    }
    
    @objc private func btnBackTap(){
        self.delegate?.pressBack()
    }
}
