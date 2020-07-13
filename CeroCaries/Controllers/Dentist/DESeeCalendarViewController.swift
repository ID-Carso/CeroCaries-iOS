//
//  DESeeCalendarViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 10/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DESeeCalendarViewController: BaseViewController {
    
    var patientList = [String]()
    var hoursList = ["10:00 am a 11:00 am",
                     "11:00 am a 12:00 pm",
                     "12:00 pm a 11:00 am",
                     "10:00 am a 1:00 pm",
                     "2:00 pm a 3:00 pm",
                     "4:00 pm a 5:00 pm",
                     "5:00 pm a 6:00 pm",
                     "6:00 pm a 7:00 pm",]

    override func viewDidLoad() {
        super.viewDidLoad()
        sectionData()

       
    }
    
    func sectionData(){
           patientList.append("Sergio Gómez")
           patientList.append("Raúl Pérez Ortíz")
           patientList.append("Mariana Brito")
           patientList.append("Miriam Lira")
           patientList.append("Alberto Torres")
           patientList.append("DISPONIBLE")
           patientList.append("Laura Morales")
           patientList.append("Luis Perez")
       }
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

   

}
// MARK: - UITableView
extension DESeeCalendarViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hoursList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seeCalendarCell") as! DESeeCalendarTableViewCell
        cell.hourLabel.text = hoursList[indexPath.row]
        cell.patientLabel.text = patientList[indexPath.row]
        if indexPath.row == 5{
            cell.hourLabel.textColor = .gray
            cell.patientLabel.textColor = .gray
           
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
