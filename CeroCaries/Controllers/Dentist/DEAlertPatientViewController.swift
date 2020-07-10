//
//  DEAlertPatientViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 08/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DEAlertPatientViewController: UIViewController {

    @IBOutlet weak var viewAlert: UIView!
    @IBOutlet weak var aceptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleAlert()

        
    }
    
    func styleAlert(){
        viewAlert.layer.cornerRadius = 15
        aceptButton.layer.cornerRadius = 10
    }
    
    @IBAction func okAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DECalendarMenuViewController")
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true, completion: nil)
    
    }

}
