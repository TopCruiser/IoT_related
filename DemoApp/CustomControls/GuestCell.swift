//
//  GuestCell.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/11/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class GuestCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
