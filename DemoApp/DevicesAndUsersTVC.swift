//
//  DevicesAndUsersTVC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/4/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

let titlesArray = ["Madison's Tablet", "Madison's Phone"]

class DevicesAndUsersTVC: UITableViewController {

    @IBOutlet weak var topView: UIView!
    
    var button : PlayPauseButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.title = "Devices and Users"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)]
        
        self.tableView.isScrollEnabled = false
        self.tableView.separatorColor = UIColor.gray
        
        self.topView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * CGFloat(0.3))
        
        let winSize = self.topView.frame.size
        self.button = PlayPauseButton(frame: CGRect(x: 0, y: 0, width: winSize.width / 7, height: winSize.width / 7))
        self.button.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)
        self.button.center = CGPoint(x: winSize.width / 2, y: winSize.height / 3)
        self.button.clipsToBounds = true;
        
        //half of the width
        //self.button.strokeColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1).cgColor
        self.button.miterLimit = 100
        self.button.lineWidth = 2.0
        self.button.layer.cornerRadius = winSize.width / 14 // 7*2
        self.button.layer.borderColor = UIColor.clear.cgColor
        self.button.layer.borderWidth = 2.0;
        
        self.button.addTarget(self, action: #selector(toggle(_:)), for:.touchUpInside)
        
        self.topView.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showSideMenu() {
        self.performSegue(withIdentifier: "SideMenuShow", sender: self)
    }
    
    func toggle(_ sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeviceCell

        let winSize = cell.contentView.bounds.size
        cell.button = PlayPauseButton(frame: CGRect(x: 0, y: 0, width: winSize.height / 2.5, height: winSize.height / 2.5))
        cell.button.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)
        
        //        self.button.translatesAutoresizingMaskIntoConstraints = false
        //        self.contentView.addConstraint(NSLayoutConstraint(item: self.button, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        //        self.contentView.addConstraint(NSLayoutConstraint(item: self.button, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
        
        cell.button.center = CGPoint(x: winSize.width * CGFloat(0.9), y: winSize.height / 1.5)
        cell.button.clipsToBounds = true;
        
        //half of the width
        cell.button.lineWidth = 1.0
        cell.button.layer.cornerRadius = winSize.height / 5
        cell.button.layer.borderColor = UIColor.clear.cgColor
        cell.button.layer.borderWidth = 1.0;
        
        cell.button.addTarget(cell, action: #selector(cell.toggle(_:)), for:.touchUpInside)
        
        cell.addSubview(cell.button)
        
        // Configure the cell...
        cell.title.text = titlesArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 8
    }
}
