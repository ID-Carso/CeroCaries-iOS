//
//  InfoTableViewCell.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 25/05/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleSection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
