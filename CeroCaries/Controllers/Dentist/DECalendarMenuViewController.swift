//
//  DECalendarMenuViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 15/06/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DECalendarMenuViewController: BaseViewController {

    @IBOutlet weak var newDateButton: UIButton!
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var seeCalendarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewStyle()
    }
    
    func viewStyle()
    {
        newDateButton.layer.cornerRadius = 10
        todayButton.layer.cornerRadius = 10
        seeCalendarButton.layer.cornerRadius = 10
        
    }

}
