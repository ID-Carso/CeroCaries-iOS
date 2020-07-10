//
//  DESelectTimeTableViewCell.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 07/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DESelectTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelHour: UILabel!
    @IBOutlet weak var imageCheck: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
