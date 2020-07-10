//
//  DEPatientTableViewCell.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 08/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DEPatientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelPatient: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
