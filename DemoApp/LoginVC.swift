//
//  LoginVC.swift
//  DemoApp
//
//  Created by user on 12/27/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

let SIGNUP_BOTTOMVIEW_PADDING : CGFloat = 30

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTF: TJTextField!
    @IBOutlet weak var passwordTF: TJTextField!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var btnSignIn: UIButton!
    
    var focusedView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        
        usernameTF.leftTextPedding = Int(Double(screenSize.width) * 0.04)
        passwordTF.leftTextPedding = Int(Double(screenSize.width) * 0.04)
        usernameTF.imageWidth = Int(Double(screenSize.width) * 0.1)
        passwordTF.imageWidth = Int(Double(screenSize.width) * 0.1)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "submenu.png") , style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem?.title = ""
        //self.navigationItem.backBarButtonItem?.title = "song"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if contentScrollView.contentSize.height < btnSignIn.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING {
            contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnSignIn.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        focusedView = textField
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {

        var keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame! as CGRect, to: nil)
        contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnSignIn.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING + (keyboardFrame?.size.height)!)
        
        if focusedView.isKind(of: UITextField.self){
            let focusedTextField : UITextField? = focusedView
            if (focusedTextField?.frame.maxY)! + contentScrollView.frame.origin.y > (keyboardFrame?.origin.y)! {
                contentScrollView.contentOffset = CGPoint(x: 0, y: (focusedTextField?.frame.maxY)! + contentScrollView.frame.origin.y - (keyboardFrame?.origin.y)!)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnSignIn.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING)
        contentScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
}
