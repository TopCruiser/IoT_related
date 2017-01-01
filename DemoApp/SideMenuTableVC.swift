//
//  SideMenuTableVC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 12/30/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

let viewControllers = ["DevicesAndUsersShow", "NetworkHealthCheckShow", "", ""]

class SideMenuTableVC: UITableViewController {

    let sideMenuItems = ["Devices and Users",
                         "Network Health Check",
                         "Guest Access",
                         "Filtering",
                         "Priority",
                         "Control IoT Devices",
                         "Notifications",
                         "Log out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.separatorColor = UIColor(red: 255/255, green: 173/255, blue: 80/255, alpha: 1)
        self.tableView.isScrollEnabled = false
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 151/255, blue: 31/255, alpha: 1)
        
        self.view.backgroundColor = UIColor.clear
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let arrayColors:Array<AnyObject> = [UIColor(red: 255/255, green: 151/255, blue: 31/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 121/255, blue: 1/255, alpha: 1).cgColor]
        gradientLayer.colors = arrayColors
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sideMenuItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = sideMenuItems[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath)
        
        for index in 0..<tableView.numberOfRows(inSection: 0){
            let other = tableView.cellForRow(at: NSIndexPath(row: index, section: 0) as IndexPath)
            if indexPath.row != index {
                other?.backgroundColor = UIColor.clear
            }
            else {
                other?.backgroundColor = UIColor(red: 255/255, green: 173/255, blue: 80/255, alpha: 1)
                self.performSegue(withIdentifier: viewControllers[index], sender: self)
            }
        }
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
