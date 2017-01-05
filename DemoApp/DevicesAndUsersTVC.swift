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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.title = "Devices and Users"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)]
        
        self.tableView.isScrollEnabled = false
        
        //self.topView.addConstraint(NSLayoutConstraint(item: self.topView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.tableView, attribute: NSLayoutAttribute.height, multiplier: 0.3, constant: 0))
        self.topView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * CGFloat(0.3))
        
        var winSize = self.topView.frame.size
        //self.button = PlayPauseButton(frame: CGRect(x: winSize.width / 2, y: winSize.height / 3, width: winSize.width / 8, height: winSize.width / 8))
        self.button = PlayPauseButton(frame: CGRect(x: 0, y: 0, width: winSize.width / 7, height: winSize.width / 7))
        self.button.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)
        self.button.center = CGPoint(x: winSize.width / 2, y: winSize.height / 3)
        self.button.clipsToBounds = true;
        
        //half of the width
        self.button.layer.cornerRadius = 25
        self.button.layer.borderColor = UIColor.clear.cgColor
        self.button.layer.borderWidth=2.0;
        
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

        // Configure the cell...
        cell.title.text = titlesArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 8
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
