//
//  DeviceCell.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/4/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class DeviceCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var state: UILabel!
    
    var button : PlayPauseButton! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func toggle(_ sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
