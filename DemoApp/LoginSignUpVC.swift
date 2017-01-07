//
//  LoginSignUpVC.swift
//  DemoApp
//
//  Created by user on 12/27/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class LoginSignUpVC: UIViewController {

    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    var toggle : Bool = false
    var loginVC : LoginVC? = nil
    var signupVC : SignupVC? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let vc = storyboard!.instantiateViewController(withIdentifier: "loginvc") as? LoginVC {
            loginVC = vc
            
            self.view.insertSubview((loginVC?.inputFieldView)!, at: 1)
            self.loginVC?.inputFieldView.center.x = self.view.center.x
            self.loginVC?.inputFieldView.center.y = self.view.center.y - self.view.bounds.size.height
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupClick(_ sender: AnyObject) {
        animateView(view: self.signupView)
        UIView.animate(withDuration: 0.1, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            if !self.toggle {
                self.signupView.center.y -= (self.signupView.bounds.size.height / 3 + 20)
                self.loginView.center.y += (self.loginView.bounds.size.height / 3 + 20)
                self.loginVC?.inputFieldView.bringSubview(toFront: self.signupView)
                self.loginVC?.inputFieldView.center.y = self.view.center.y
            } else{
                self.signupView.center.y += (self.signupView.bounds.size.height / 3 + 20)
                self.loginView.center.y -= (self.loginView.bounds.size.height / 3 + 20)
                self.loginVC?.inputFieldView.center.y = self.view.center.y - self.view.bounds.size.height
            }
        }) { (Bool) in
                
        }
        UIView.animate(withDuration: 0.1, delay: 0.4, options: UIViewAnimationOptions.curveEaseOut, animations: {
            if !self.toggle {
                self.signupView.center.y += 20
                self.loginView.center.y -= 20
            } else{
                self.signupView.center.y -= 20
                self.loginView.center.y += 20
            }
        }) { (Bool) in
            
        }
        toggle = !toggle
    }
    
    @IBAction func loginClick(_ sender: AnyObject) {
        animateView(view: self.loginView)
    }
    
    func animateView(view : UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        })
        UIView.animate(withDuration: 0.2, animations: {
            view.backgroundColor = UIColor.clear
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
