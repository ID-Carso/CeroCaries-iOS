//
//  NRInfoViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 26/06/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class NRInfoViewController: BaseViewController {
    
    @IBOutlet weak var tableSection: UITableView!
    
    var sections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Disable DarkMode for placeholder
        disableDarkMode()
        //NavigationBarConfig
        imageNavBar()
        //TableView
        sectionData()
        tableSection.delegate = self
        tableSection.dataSource = self
    
    }
    
    func sectionData(){
        sections.append("Acerca de nosotros")
        sections.append("Información para la odontología y la salud")
        sections.append("Escuelas libres de caries")
        sections.append("Mitos y Realidades")
        sections.append("Factores de riesgo")
        
    }
    

    
}

// MARK: - UITableView
extension NRInfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NRInfoTableViewCell
        
        cell.titleSection.text = sections[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

}
