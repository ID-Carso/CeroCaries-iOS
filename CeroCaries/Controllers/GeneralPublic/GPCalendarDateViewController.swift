//
//  GPCalendarDateViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 01/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class GPCalendarDateViewController: BaseViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       dateLabel.text = dateString
    
    }
    


}
