//
//  PriorityDeviceVC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/3/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class PriorityDeviceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.title = "Priority Devices"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSideMenu() {
        self.performSegue(withIdentifier: "SideMenuShow", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
