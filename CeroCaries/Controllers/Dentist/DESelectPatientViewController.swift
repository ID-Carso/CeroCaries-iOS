//
//  DESelectPatientViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 07/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DESelectPatientViewController: BaseViewController {
    
    var patientList = [String]()
    var HourSelectForDate : String? = ""
    var patientSelected : String?
    
    @IBOutlet weak var labelHour: UILabel!
    @IBOutlet weak var labelDateStrng: UILabel!
    @IBOutlet weak var tablePatient: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelHour.text = HourSelectForDate
        labelDateStrng.text = dateStringDentist
        sectionData()
    }
    func sectionData(){
        patientList.append("Sergio Gómez")
        patientList.append("Raul Perez")
        patientList.append("Eduardo López")
        patientList.append("Mariana Perez")
        patientList.append("Araceli Perez")
        patientList.append("Ana Morales")
        patientList.append("Felipe Pozos")
        patientList.append("Andres Bustamante")
    }
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UITableView
extension DESelectPatientViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell") as! DEPatientTableViewCell
        cell.labelPatient.text = patientList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        patientSelected = patientList[indexPath.row]
        //Navegation  goToSelectPatient
        self.performSegue(withIdentifier:"goToConfirm", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Pass hourselecteD to other VC
        if segue.identifier == "goToConfirm"{
            let destinationVC  = segue.destination as!  DEConfirmViewController
            destinationVC.patientSelectedPrev = patientSelected
            destinationVC.hourSelectedPrev = HourSelectForDate
        }
    }
    

}
