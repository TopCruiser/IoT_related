//
//  BallAnimationView.swift
//
//  Code generated using QuartzCode 1.55.0 on 1/5/17.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class BallAnimationView: UIView, CAAnimationDelegate {
    
    var layers : Dictionary<String, AnyObject> = [:]
    var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
    var updateLayerValueForCompletedAnimation : Bool = false
    
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupProperties()
        setupLayers()
    }
    
    
    
    func setupProperties(){
        
    }
    
    func setupLayers(){
        let rectangle = CAShapeLayer()
        rectangle.frame = CGRect(x: 15.5, y: 71.5, width: 69, height: 24)
        rectangle.path = rectanglePath().cgPath
        self.layer.addSublayer(rectangle)
        layers["rectangle"] = rectangle
        
        let oval = CAShapeLayer()
        oval.frame = CGRect(x: 44.5, y: 72, width: 11, height: 11)
        oval.path = ovalPath().cgPath
        self.layer.addSublayer(oval)
        layers["oval"] = oval
        
        let oval2 = CAShapeLayer()
        oval2.frame = CGRect(x: 42, y: 69, width: 16, height: 4)
        oval2.path = oval2Path().cgPath
        self.layer.addSublayer(oval2)
        layers["oval2"] = oval2
        
        resetLayerProperties(forLayerIdentifiers: nil)
    }
    
    func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if layerIds == nil || layerIds.contains("rectangle"){
            let rectangle = layers["rectangle"] as! CAShapeLayer
            rectangle.fillColor   = UIColor(red:1, green: 0.925, blue:0.0392, alpha:1).cgColor
            rectangle.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
        }
        if layerIds == nil || layerIds.contains("oval"){
            let oval = layers["oval"] as! CAShapeLayer
            oval.fillColor   = UIColor(red:0.996, green: 0.996, blue:0.0392, alpha:1).cgColor
            oval.strokeColor = UIColor.yellow.cgColor
        }
        if layerIds == nil || layerIds.contains("oval2"){
            let oval2 = layers["oval2"] as! CAShapeLayer
            oval2.fillColor   = UIColor.yellow.cgColor
            oval2.strokeColor = UIColor.yellow.cgColor
        }
        
        CATransaction.commit()
    }
    
    //MARK: - Animation Setup
    
    func addUntitled1Animation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = 1.384
            completionAnim.delegate = self
            completionAnim.setValue("Untitled1", forKey:"animId")
            completionAnim.setValue(false, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"Untitled1")
            if let anim = layer.animation(forKey: "Untitled1"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : String = kCAFillModeForwards
        
        ////Oval animation
        let ovalPositionAnim      = CAKeyframeAnimation(keyPath:"position")
        ovalPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 50, y: 77.5)), NSValue(cgPoint: CGPoint(x: 50, y: 0))]
        ovalPositionAnim.keyTimes = [0, 1]
        ovalPositionAnim.duration = 1.38
        
        let ovalTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        ovalTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                       NSValue(caTransform3D: CATransform3DIdentity)]
        ovalTransformAnim.keyTimes  = [0, 1]
        ovalTransformAnim.duration  = 1.3
        ovalTransformAnim.beginTime = 0.0827
        
        let ovalUntitled1Anim : CAAnimationGroup = QCMethod.group(animations: [ovalPositionAnim, ovalTransformAnim], fillMode:fillMode)
        layers["oval"]?.add(ovalUntitled1Anim, forKey:"ovalUntitled1Anim")
        
        ////Oval2 animation
        let oval2TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
        oval2TransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity),
                                       NSValue(caTransform3D: CATransform3DMakeScale(0.5, 1.5, 1))]
        oval2TransformAnim.keyTimes = [0, 1]
        oval2TransformAnim.duration = 0.329
        
        let oval2PositionAnim       = CAKeyframeAnimation(keyPath:"position")
        oval2PositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 50, y: 71)), NSValue(cgPoint: CGPoint(x: 50, y: 80))]
        oval2PositionAnim.keyTimes  = [0, 1]
        oval2PositionAnim.duration  = 0.127
        oval2PositionAnim.beginTime = 0.281
        
        let oval2Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval2TransformAnim, oval2PositionAnim], fillMode:fillMode)
        layers["oval2"]?.add(oval2Untitled1Anim, forKey:"oval2Untitled1Anim")
    }
    
    //MARK: - Animation Cleanup
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
                removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }
    
    func updateLayerValues(forAnimationId identifier: String){
        if identifier == "Untitled1"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval"] as! CALayer).animation(forKey: "ovalUntitled1Anim"), theLayer:(layers["oval"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval2"] as! CALayer).animation(forKey: "oval2Untitled1Anim"), theLayer:(layers["oval2"] as! CALayer))
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "Untitled1"{
            (layers["oval"] as! CALayer).removeAnimation(forKey: "ovalUntitled1Anim")
            (layers["oval2"] as! CALayer).removeAnimation(forKey: "oval2Untitled1Anim")
        }
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            (layer as! CALayer).removeAllAnimations()
        }
    }
    
    //MARK: - Bezier Path
    
    func rectanglePath() -> UIBezierPath{
        let rectanglePath = UIBezierPath(rect:CGRect(x: 0, y: 0, width: 69, height: 24))
        return rectanglePath
    }
    
    func ovalPath() -> UIBezierPath{
        let ovalPath = UIBezierPath()
        ovalPath.move(to: CGPoint(x: 5.5, y: 0))
        ovalPath.addCurve(to: CGPoint(x: 0, y: 5.5), controlPoint1:CGPoint(x: 2.462, y: 0), controlPoint2:CGPoint(x: 0, y: 2.462))
        ovalPath.addCurve(to: CGPoint(x: 5.5, y: 11), controlPoint1:CGPoint(x: 0, y: 8.538), controlPoint2:CGPoint(x: 2.462, y: 11))
        ovalPath.addCurve(to: CGPoint(x: 11, y: 5.5), controlPoint1:CGPoint(x: 8.538, y: 11), controlPoint2:CGPoint(x: 11, y: 8.538))
        ovalPath.addCurve(to: CGPoint(x: 5.5, y: 0), controlPoint1:CGPoint(x: 11, y: 2.462), controlPoint2:CGPoint(x: 8.538, y: 0))
        
        return ovalPath
    }
    
    func oval2Path() -> UIBezierPath{
        let oval2Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 16, height: 4))
        return oval2Path
    }
    
    
}
