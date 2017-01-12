//
//  FilteringVC.swift
//  DemoApp
//
//  Created by Foni Rewenig on 1/3/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

struct defaultColors {
    var r : CGFloat
    var g : CGFloat
    var b : CGFloat
}

class FilteringVC: UIViewController {

    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var labelColor: UILabel!
    
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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "left_sidemenu_button.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showSideMenu))
        self.navigationItem.title = "Filtering"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255, green:255/255, blue:255/255, alpha:1)]
        
        
        self.buildCircleSlider()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.circleSlider.frame = self.sliderView.bounds
    }
    
    private func buildCircleSlider() {
        self.circleSlider = CircleSlider(frame: self.sliderView.bounds, options: self.sliderOptions)
        self.circleSlider?.addTarget(self, action: #selector(valueChange(sender:)), for: .valueChanged)
        self.sliderView.addSubview(self.circleSlider!)
        //        self.valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //        self.valueLabel.textAlignment = .center
        //        self.circleSlider.addSubview(self.valueLabel)
    }
    
    func valueChange(sender: CircleSlider) {
        let val = Float(sender.value)
        let color : UIColor!
        if val >= 0 && val < 20 {
            color = UIColor(red: 255 / 255, green: CGFloat(6 * val / 255), blue: 0, alpha: 1)
            labelColor.text = "U"
        } else if val >= 20 && val < 40 {
            color = UIColor(red: 255 / 255, green: CGFloat((125 + 6 * (val - 20)) / 255), blue: 0, alpha: 1)
            labelColor.text = "R"
        } else if val >= 40 && val < 60 {
            color = UIColor(red: CGFloat(255 - 6 * (val - 40)) / 255, green: 255, blue: 0, alpha: 1)
            labelColor.text = "PC-13"
        } else if val >= 60 && val < 80 {
            color = UIColor(red: CGFloat(125 - 6 * (val - 60)) / 255, green: 255, blue: 0, alpha: 1)
            labelColor.text = "PG"
        } else{
            color = UIColor(red: 0, green: CGFloat(255 - 6 * (val - 80)) / 255, blue: CGFloat(val - 80) / 255, alpha: 1)
            labelColor.text = "G"
        }
        labelColor.textColor = color
    }
    
//    if(progress >= 0 && progress < 20) {
//    setRGBtxtProgress(255, 6 * progress, 0, getString(R.string.filter_U), progress);
//    }else if (progress >= 20 && progress < 40){
//    setRGBtxtProgress(255, 125 + 6 * (progress-20), 0, getString(R.string.filter_R), progress);
//    } else if (progress >= 40 && progress < 60){
//    setRGBtxtProgress(255 - 6 * (progress-40), 255, 0, getString(R.string.filter_PG_13), progress);
//    }else if (progress >= 60 && progress < 80) {
//    setRGBtxtProgress(125 - 6 * (progress-60), 255, 0, getString(R.string.filter_PG), progress);
//    }else if  (progress >= 80 && progress <= 100){
//    setRGBtxtProgress(0, 255 - 6 * (progress-80), progress - 80, getString(R.string.filter_G), progress);
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSideMenu() {
        self.performSegue(withIdentifier: "SideMenuShow", sender: self)
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
