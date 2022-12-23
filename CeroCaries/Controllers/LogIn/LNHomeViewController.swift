//
//  ViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 15/05/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit
import SwiftUI

class LNHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Disable DarkMode for placeholder
//        disableDarkMode()
        //NavigationBarConfig
//        imageNavBar()
        viewStyle()
        
        
    }
    
    func viewStyle(){

        let root = HomeView()
        
        let host = UIHostingController(rootView: root)
        self.navigationController?.pushViewController(host, animated: true)
    }
    


}




