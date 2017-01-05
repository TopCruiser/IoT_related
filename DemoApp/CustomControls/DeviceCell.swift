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
        // Initialization code
        var winSize = self.contentView.frame.size
        //self.button = PlayPauseButton(frame: CGRect(x: winSize.width / 2, y: winSize.height / 3, width: winSize.width / 8, height: winSize.width / 8))
        self.button = PlayPauseButton(frame: CGRect(x: 0, y: 0, width: winSize.height / 5, height: winSize.height / 5))
        self.button.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)
        self.button.center = CGPoint(x: winSize.width * CGFloat(0.9), y: winSize.height / 3)
        self.button.clipsToBounds = true;
        
        //half of the width
        self.button.layer.cornerRadius = 13
        self.button.layer.borderColor = UIColor.clear.cgColor
        self.button.layer.borderWidth=2.0;
        
        self.button.addTarget(self, action: #selector(toggle(_:)), for:.touchUpInside)
        
        self.contentView.addSubview(button)

    }
    
    func toggle(_ sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
