//
//  MainNC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 12/28/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class MainNC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView(){
        
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barTintColor = UIColor(red: 191/255, green:46/255, blue:26/255, alpha: 1)
        
        let titleDict : NSDictionary = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "submenu.png"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(stupidAction))
    }
    
}
