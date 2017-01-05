//
//  ControlIoTVC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/4/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class ControlIoTVC: UIViewController {

    var button : PlayPauseButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.title = "Hallway"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)]
        
        // Do any additional setup after loading the view.
        let winSize = self.view.frame.size
        //self.button = PlayPauseButton(frame: CGRect(x: winSize.width / 2, y: winSize.height / 3, width: winSize.width / 8, height: winSize.width / 8))
        self.button = PlayPauseButton(frame: CGRect(x: 0, y: 0, width: winSize.width / 7, height: winSize.width / 7))
        self.button.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)
        self.button.center = CGPoint(x: winSize.width / 2, y: winSize.height / 1.8)
        self.button.clipsToBounds = true;
        
        //half of the width
        self.button.layer.cornerRadius = 25
        self.button.layer.borderColor = UIColor.clear.cgColor
        self.button.layer.borderWidth=2.0;
        
        self.button.addTarget(self, action: #selector(toggle(_:)), for:.touchUpInside)
        
        self.view.addSubview(button)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
