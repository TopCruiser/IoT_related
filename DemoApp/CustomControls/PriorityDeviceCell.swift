//
//  PriorityDeviceCell.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/3/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class PriorityDeviceCell: UITableViewCell {

    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var switchOn: UISwitch!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var labelDesription: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class var expandHeight : CGFloat { get {return 200} }
    class var defaultHeight : CGFloat { get {return 60} }
    
    func checkHeight(){
        let hidden = frame.size.height < PriorityDeviceCell.expandHeight
        labelDesription.isHidden = hidden
        switchOn.isHidden = hidden
        buttonSave.isHidden = hidden
    }
    
    func watchFrameChanges(){
        addObserver(self, forKeyPath: "frame", options: .new, context: nil)
        checkHeight()
    }
    
    func ignoreFrameChanges(){
        //removeObserver(self, forKeyPath: "frame")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
}
