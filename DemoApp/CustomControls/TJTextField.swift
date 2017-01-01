//
//  TJTextField.swift
//  UnderLineTextField
//
//  Created by Tejas Ardeshna on 31/12/15.
//  Copyright © 2015 Tejas Ardeshna. All rights reserved.
//

import UIKit

@IBDesignable class TJTextField: UITextField {
    
    fileprivate var ImgIcon: UIImageView?
    
    @IBInspectable var errorEntry: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var leftTextPedding: Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var lineColor: UIColor = UIColor.black {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var placeHolerColor: UIColor = UIColor.red{//(red: 199.0/255.0, green: 199.0/255.0, blue: 205.0/255.0, alpha: 1.0) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var errorColor: UIColor = UIColor.red {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var imageWidth: Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var txtImage : UIImage? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    fileprivate func newBounds(_ bounds: CGRect) -> CGRect {
        
        var newBounds = bounds
        newBounds.origin.x += CGFloat(leftTextPedding) + CGFloat(imageWidth)
        return newBounds
    }
    
    var errorMessage: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setting left image
        if (txtImage != nil)
        {
            let imgView = UIImageView(image: txtImage)
            imgView.frame = CGRect(x: 10, y: 0, width: CGFloat(imageWidth), height: self.frame.height)
            imgView.sizeThatFits(CGSize(width: 10, height: 10))
            imgView.contentMode = .center
            imgView.image = self.resizeImage(image: imgView.image!, targetSize: CGSize(width : imageWidth, height : imageWidth))
            
            self.leftViewMode = UITextFieldViewMode.always
            self.leftView = imgView
        }
    }
    
    override func draw(_ rect: CGRect)
    {
        let height = self.bounds.height
        
        // get the current drawing context
        let context = UIGraphicsGetCurrentContext()
        
        // set the line color and width
        if errorEntry {
            context?.setStrokeColor(errorColor.cgColor)
            context?.setLineWidth(1.5)
        } else {
            context?.setStrokeColor(lineColor.cgColor)
            context?.setLineWidth(0.5)
        }
        
        // start a new Path
        context?.beginPath()
        
        context!.move(to: CGPoint(x: self.bounds.origin.x, y: height - 0.5))
        context!.addLine(to: CGPoint(x: self.bounds.size.width, y: height - 0.5))
        // close and stroke (draw) it
        context?.closePath()
        context?.strokePath()
        
        //Setting custom placeholder color
        if let strPlaceHolder: String = self.placeholder
        {
            self.attributedPlaceholder = NSAttributedString(string:strPlaceHolder,
                attributes:[NSForegroundColorAttributeName:placeHolerColor])
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect
    {
        return CGRect(x: 0, y: 0, width: CGFloat(imageWidth) + 10, height: self.frame.height)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width : size.width * heightRatio, height : size.height * heightRatio)
        } else {
            newSize = CGSize(width : size.width * widthRatio,  height : size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

