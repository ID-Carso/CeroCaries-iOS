//
//  DESeeCalendarTableViewCell.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 10/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DESeeCalendarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var patientLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
