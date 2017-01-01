//
//  SignupVC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 12/29/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class SignupVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var nameTF: TJTextField!
    @IBOutlet weak var passwordTF: TJTextField!
    @IBOutlet weak var emailTF: TJTextField!
    
    var focusedView: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        
        nameTF.imageWidth = Int(Double(screenSize.width) * 0.1)
        passwordTF.imageWidth = Int(Double(screenSize.width) * 0.1)
        emailTF.imageWidth = Int(Double(screenSize.width) * 0.1)
        
        nameTF.leftTextPedding = Int(Double(screenSize.width) * 0.04)
        passwordTF.leftTextPedding = Int(Double(screenSize.width) * 0.04)
        emailTF.leftTextPedding = Int(Double(screenSize.width) * 0.04)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if contentScrollView.contentSize.height < btnSignUp.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING {
            contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnSignUp.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING)
        }
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
        contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnSignUp.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING + (keyboardFrame?.size.height)!)
        
        if focusedView.isKind(of: UITextField.self){
            let focusedTextField : UITextField? = focusedView
            if (focusedTextField?.frame.maxY)! + contentScrollView.frame.origin.y > (keyboardFrame?.origin.y)! {
                contentScrollView.contentOffset = CGPoint(x: 0, y: (focusedTextField?.frame.maxY)! + contentScrollView.frame.origin.y - (keyboardFrame?.origin.y)!)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnSignUp.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING)
        contentScrollView.contentOffset = CGPoint(x: 0, y: 0)
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
