//
//  LNWelcomeViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 09/06/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class LNWelcomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Disable DarkMode for placeholder
        disableDarkMode()
        //NavigationBarConfig
        imageNavBar()

        
    }
    
    @IBAction func actionWelcome(_ sender: Any) {
        performSegue(withIdentifier: "Dentist", sender: nil)
    }
    
    
}


