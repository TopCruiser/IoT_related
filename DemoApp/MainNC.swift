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
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
}
