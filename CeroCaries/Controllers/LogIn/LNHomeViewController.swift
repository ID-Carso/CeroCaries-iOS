//
//  ViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 15/05/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit
import SwiftUI

class LNHomeViewController: BaseViewController {
    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var withOutRegisterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Disable DarkMode for placeholder
//        disableDarkMode()
        //NavigationBarConfig
//        imageNavBar()
        viewStyle()
        
        
    }
    
    func viewStyle(){
        logInBtn.layer.cornerRadius = 10
        createAccountBtn.layer.cornerRadius = 10
        withOutRegisterBtn.layer.cornerRadius = 10

        let root = HomeView()
        
        let host = UIHostingController(rootView: root)
        self.navigationController?.pushViewController(host, animated: true)
    }
    


}




