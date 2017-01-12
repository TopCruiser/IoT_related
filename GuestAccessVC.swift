//
//  GuestAccessVC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/11/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

let sentence1 = ["Network Name", "Network Password"]
let sentence2 = ["Jones Family Guest", "Network Password"]

class GuestAccessVC: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var switchEnable: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.title = "Guest Access"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)]
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        self.tableView.separatorColor = UIColor.darkGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSideMenu() {
        self.performSegue(withIdentifier: "SideMenuShow", sender: self)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GuestCell
        
        // Configure the cell...
        cell.labelName.text = sentence1[indexPath.row]
        cell.textField.attributedPlaceholder = NSAttributedString(string:sentence2[indexPath.row],
                                                                            attributes:[NSForegroundColorAttributeName:UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)])
        cell.textField.tintColor = UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
