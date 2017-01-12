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
    
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    
    var circleSlider: CircleSlider!
    
    private var sliderOptions: [CircleSliderOption] {
        return [
            CircleSliderOption.barColor(UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)),
            //CircleSliderOption.thumbColor(UIColor(red: 141/255, green: 185/255, blue: 204/255, alpha: 1)),
            CircleSliderOption.trackingColor(UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)),
            CircleSliderOption.barWidth(10),
            CircleSliderOption.startAngle(135),
            CircleSliderOption.maxValue(133),
            CircleSliderOption.minValue(0),
            CircleSliderOption.thumbImage(UIImage(named: "thumb")!)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green:152/255, blue:31/255, alpha:1)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.title = "Hallway"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)]
        
        // Do any additional setup after loading the view.
        let winSize = self.view.frame.size
        self.button = PlayPauseButton(frame: CGRect(x: 0 , y: 0, width: winSize.width / 7, height: winSize.width / 7))
        self.button.center = self.view.center
        self.button.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 31/255, alpha: 1)
        self.button.clipsToBounds = true;
        self.button.lineWidth = 2.0
        self.button.layer.cornerRadius = winSize.width / 14
        self.button.layer.borderColor = UIColor.clear.cgColor
        self.button.layer.borderWidth = 2.0;
        self.button.addTarget(self, action: #selector(toggle(_:)), for:.touchUpInside)
        self.view.addSubview(self.button)
        
        self.buildCircleSlider()
    }

    private func buildCircleSlider() {
        self.circleSlider = CircleSlider(frame: self.sliderView.bounds, options: self.sliderOptions)
        self.circleSlider?.addTarget(self, action: #selector(valueChange(sender:)), for: .valueChanged)
        self.sliderView.addSubview(self.circleSlider!)
    }
    
    func valueChange(sender: CircleSlider) {
        self.percentLabel.text = "Light@ " + String(Int(sender.value)) + "%"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.circleSlider.frame = self.sliderView.bounds
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
