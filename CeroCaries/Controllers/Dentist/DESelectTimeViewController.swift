//
//  DESelectTimeViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 07/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DESelectTimeViewController: BaseViewController {
    
    var hoursList = [String]()
    var hourSelected : String?
    
    @IBOutlet weak var labelSelectDate: UILabel!
    @IBOutlet weak var tableHours: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Disable DarkMode for placeholder
        disableDarkMode()
        //NavigationBarConfig
        imageNavBar()
        //TableView
        sectionData()
        labelSelectDate.text = dateStringDentist
    }
    
    func sectionData(){
        hoursList.append("10:00 am a 11:00 am")
        hoursList.append("11:00 am a 12:00 pm")
        hoursList.append("12:00 pm a 1:00 pm")
        hoursList.append("1:00 pm a 2:00 pm")
        hoursList.append("2:00 pm a 3:00 pm")
        hoursList.append("4:00 pm a 5:00 pm")
        hoursList.append("5:00 pm a 6:00 pm")
        hoursList.append("6:00 pm a 7:00 pm")
    }
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableView
extension DESelectTimeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hoursList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectTimeCell") as! DESelectTimeTableViewCell
        cell.labelHour.text = hoursList[indexPath.row]
        if indexPath.row == 1{
            cell.labelHour.textColor = .gray
            cell.imageCheck.tintColor = .gray
            //TODO: add image asset
            if #available(iOS 13.0, *) {
                cell.imageCheck.image = UIImage(systemName: "circle")
            } else {
                // Fallback on earlier versions
            }
            //
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hourSelected = hoursList[indexPath.row]
        //Navegation  goToSelectPatient
        self.performSegue(withIdentifier:"goToPatient", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Pass hourselecteD to other VC
        if segue.identifier == "goToPatient"{
            let destinationVC  = segue.destination as!  DESelectPatientViewController
            destinationVC.HourSelectForDate = hourSelected
        }
    }
    

}

