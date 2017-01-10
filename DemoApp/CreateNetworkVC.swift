//
//  CreateNetworkVC.swift
//  DemoApp
//
//  Created by user on 12/28/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
//import SideMenu

class CreateNetworkVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var keyTF: TJTextField!
    @IBOutlet weak var wifiTF: TJTextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    var focusedView: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal) , style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)]
        self.navigationItem.title = "Create Your Network"
        
        //Initialize parameters with which controls SideMenu...
        let modes:[SideMenuManager.MenuPresentMode] = [.menuSlideIn, .viewSlideOut, .viewSlideInOut, .menuDissolveIn]
        SideMenuManager.menuPresentMode = modes[0]
        SideMenuManager.menuBlurEffectStyle = nil
        
        let screenSize = UIScreen.main.bounds
        keyTF.imageWidth = Int(Double(screenSize.width) * 0.1)
        wifiTF.imageWidth = Int(Double(screenSize.width) * 0.1)
        
        keyTF.leftTextPedding = Int(Double(screenSize.width) * 0.04)
        wifiTF.leftTextPedding = Int(Double(screenSize.width) * 0.04)
        
        //Register keyboard notificatin...
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if contentScrollView.contentSize.height < btnNext.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING {
            contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnNext.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING)
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
    
    func showSideMenu() {
        self.performSegue(withIdentifier: "SideMenuShow", sender: self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        var keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame! as CGRect, to: nil)
        contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnNext.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING + (keyboardFrame?.size.height)!)
        
        if focusedView.isKind(of: UITextField.self){
            let focusedTextField : UITextField? = focusedView
            if (focusedTextField?.frame.maxY)! + contentScrollView.frame.origin.y > (keyboardFrame?.origin.y)! {
                contentScrollView.contentOffset = CGPoint(x: 0, y: (focusedTextField?.frame.maxY)! + contentScrollView.frame.origin.y - (keyboardFrame?.origin.y)!)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width, height: btnNext.frame.maxY + SIGNUP_BOTTOMVIEW_PADDING)
        contentScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
}
