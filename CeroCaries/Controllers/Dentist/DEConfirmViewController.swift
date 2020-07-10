//
//  DEConfirmViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 07/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DEConfirmViewController: BaseViewController {
    
    var patientSelectedPrev : String? = ""
    var hourSelectedPrev : String? = ""
    
    

    @IBOutlet weak var labelPatient: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelHour: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewStyle()
       
    }
    
    func viewStyle(){
        labelDate.text = dateStringDentist
        labelPatient.text = patientSelectedPrev
        labelHour.text = hourSelectedPrev
        saveButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        
    }
    
    func showAlert(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier:"DEAlertPatientViewController")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveAction(_ sender: Any) {
        showAlert()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
  

}
