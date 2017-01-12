//
//  LoginSignUpVC.swift
//  DemoApp
//
//  Created by user on 12/27/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class LoginSignUpVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var divider: UIImageView!
    
    @IBOutlet weak var inputView1: UIView!
    @IBOutlet weak var inputView2: UIView!
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var signupView: UIView!
    
    
    @IBOutlet weak var passwordS: TJTextField!
    @IBOutlet weak var emailS: TJTextField!
    @IBOutlet weak var userNameS: TJTextField!
    
    @IBOutlet weak var userNameL: TJTextField!
    @IBOutlet weak var passwordL: TJTextField!

    
    var toggleShow : Bool = false
    
    var focusedTF : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register keyboard notificatin...
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.inputView2.isHidden = true
        self.inputView1.isHidden = true
        self.userNameL.tintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        self.userNameS.tintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        self.passwordL.tintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        self.passwordS.tintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        self.emailS.tintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        focusedTF = textField
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.inputView1.isHidden {
            if textField == self.userNameS {
                self.emailS.becomeFirstResponder()
            } else if textField == self.emailS{
                self.passwordS.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        } else{
            if(textField == self.userNameL){
                self.passwordL.becomeFirstResponder()
            }
            else{
                textField.resignFirstResponder()
            }
        }
        
        return true
    }
    
    
    @IBAction func signupClick(_ sender: AnyObject) {
        animateView(view: self.signupView)
        
        self.inputView1.isHidden = true;
        
        UIView.animate(withDuration: 0.3, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            if !self.toggleShow {
                self.signupView.center.y -= (self.signupView.bounds.size.height / 3 + 20)
                self.loginView.center.y += (self.loginView.bounds.size.height / 4 + 20)
            } else{
                self.signupView.center.y += (self.signupView.bounds.size.height / 3 + 20)
                self.loginView.center.y -= (self.loginView.bounds.size.height / 4 + 20)
            }
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.7, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            if !self.toggleShow {
                self.signupView.center.y += 20
                self.loginView.center.y -= 20
            } else{
                self.signupView.center.y -= 20
                self.loginView.center.y += 20
            }
        }) { (Bool) in
            
        }
        
        ////////////
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.inputView1.isHidden = true;
            if !self.toggleShow {
                self.divider.center.y = self.view.center.y + (self.signupView.bounds.size.height / 2 + 20)
                self.inputView2.center.y = self.view.center.y
            } else{
                self.divider.center.y = self.view.center.y
                self.inputView2.center.y = self.view.center.y * 1.5
            }
            
        }) { (Bool) in
        }
        toggleShow = !toggleShow
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if !self.toggleShow {
                self.inputView2.isHidden = true
            } else {
                self.inputView2.isHidden = false;
            }
        }
    }
    
    @IBAction func loginClick(_ sender: AnyObject) {
        animateView(view: self.loginView)
        
        UIView.animate(withDuration: 0.3, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            if !self.toggleShow {
                self.signupView.center.y -= (self.signupView.bounds.size.height / 3 + 20)
                self.loginView.center.y += (self.loginView.bounds.size.height / 4 + 20)
            } else{
                self.signupView.center.y += (self.signupView.bounds.size.height / 3 + 20)
                self.loginView.center.y -= (self.loginView.bounds.size.height / 4 + 20)
            }
            }) { (Bool) in
                
        }

        UIView.animate(withDuration: 0.3, delay: 0.7, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            if !self.toggleShow {
                self.signupView.center.y += 20
                self.loginView.center.y -= 20
            } else{
                self.signupView.center.y -= 20
                self.loginView.center.y += 20
            }
        }) { (Bool) in
        }

        ////////////
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.inputView2.isHidden = true;
            if !self.toggleShow {
                self.divider.center.y = self.view.center.y - (self.loginView.bounds.size.height / 2 + 20)
                self.inputView1.center.y = self.view.center.y * 1
            } else{
                self.divider.center.y = self.view.center.y
                self.inputView1.center.y = self.view.center.y * 1.5
            }
            
        }) { (Bool) in
        }
        toggleShow = !toggleShow
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if !self.toggleShow {
                self.inputView1.isHidden = true
            } else {
                self.inputView1.isHidden = false;
            }
        }
    }
    
    func animateView(view : UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        })
        UIView.animate(withDuration: 0.2, animations: {
            view.backgroundColor = UIColor.clear
        })
    }
    
    func keyboardWillShow(notification: NSNotification) {
//        var keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        keyboardFrame = self.view.convert(keyboardFrame! as CGRect, to: nil)
        
//        if self.inputScrollView1.isHidden {
//            self.inputView2.center.y  = self.view.bounds.size.height - (keyboardFrame?.size.height)! - self.inputView2.bounds.size.height / 3
//        } else{
//            self.inputScrollView1.center.y  = self.view.bounds.size.height - (keyboardFrame?.size.height)! - self.inputScrollView1.bounds.size.height / 3
//        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
//        var keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        keyboardFrame = self.view.convert(keyboardFrame! as CGRect, to: nil)
//        
//        if self.inputView1.isHidden {
//            self.inputView2.center.y  = self.view.bounds.size.height - (keyboardFrame?.size.height)! - self.inputView2.bounds.size.height / 3
//        } else{
//            self.inputView1.center.y  = self.view.bounds.size.height - (keyboardFrame?.size.height)! - self.inputView1.bounds.size.height / 3
//        }
    }
}
