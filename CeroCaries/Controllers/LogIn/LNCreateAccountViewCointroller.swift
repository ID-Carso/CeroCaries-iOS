//
//  CreateAccountViewCointroller.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 20/05/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import Foundation

import UIKit

class LNCreateAccountViewController : BaseViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewNickName: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPass: UIView!
    @IBOutlet weak var dayTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
        //Disable DarkMode for placeholder
        disableDarkMode()
        //NavigationBarConfig
        imageNavBar()
        configStyleView()
        
    }
    
    func configStyleView(){
        dayTxt.delegate =  self
        btnNext.layer.cornerRadius = 10
        _ = configTextView(view: viewName)
        _ = configTextView(view: viewNickName)
        _ = configTextView(view: viewEmail)
        _ = configTextView(view: viewPass)
        
        
    }
    
    func configTextView(view: UIView) -> UIView{
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 17
        view.layer.borderColor = UIColor(red: 70.0/255, green: 143.0/255, blue: 204.0/255, alpha: 1.0).cgColor
        return view
    }
    
    
}

extension LNCreateAccountViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = dayTxt.text else {return true}
        let newLength = text.count +  string.count  - range.length
        return newLength <= 2
        
    }
   
}

