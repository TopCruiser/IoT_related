//
//  ViewController.swift
//  DemoApp
//
//  Created by user on 12/27/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true;
        self.perform(#selector(self.transitToNextViewController), with : nil, afterDelay : 3.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func transitToNextViewController()
    {
        self.performSegue(withIdentifier : "segueFromSplash", sender:self)
    }
}

