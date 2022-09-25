//
//  SplashScreenVC.swift
//  Pokemon
//
//  Created by Faza Azizi on 25/09/22.
//

import UIKit

class SplashScreenVC: UIViewController {

    var presenter: VTPSplashScreenProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if let navigation = self.navigationController {
                self.presenter?.gotoHome(nav: navigation)
            }
        }
    }

}

extension SplashScreenVC: PTVSplashScreenProtocol{
    
}
