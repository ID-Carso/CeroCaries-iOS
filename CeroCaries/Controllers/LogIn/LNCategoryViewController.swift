//
//  LNCategoryViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 09/06/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class LNCategoryViewController: BaseViewController {
    
    @IBOutlet weak var dentistBtn: UIButton!
    @IBOutlet weak var individualBtn: UIButton!
    @IBOutlet weak var schoolBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //Disable DarkMode for placeholder
       disableDarkMode()
       //NavigationBarConfig
       imageNavBar()
       //ConfigStyleView
       viewStyle()

        
    }
    
    func viewStyle(){
        
        _ = configButton(button: dentistBtn)
        _ = configButton(button: individualBtn)
        _ = configButton(button: schoolBtn)
        
    }
    
    func configButton(button: UIButton) -> UIButton{
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 17
        button.layer.borderColor = UIColor(red: 68.0/255, green: 68.0/255, blue: 115.0/255, alpha: 1.0).cgColor
        return button
    }
    

    @IBAction func actionDentist(_ sender: Any) {
        
        dentistBtn.setTitleColor(.white, for: .normal)
        
        dentistBtn.backgroundColor = UIColor(red: 33/255, green: 68/255, blue: 115/255, alpha: 1)
    }
    

}
