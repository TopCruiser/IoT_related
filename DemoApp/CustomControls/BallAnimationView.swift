//
//  BallAnimationView.swift
//
//  Code generated using QuartzCode 1.55.0 on 1/6/17.
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
    
    override var frame: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    override var bounds: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    func setupProperties(){
        
    }
    
    func setupLayers(){
        let rectangle = CAShapeLayer()
        self.layer.addSublayer(rectangle)
        layers["rectangle"] = rectangle
        
        let oval = CAShapeLayer()
        self.layer.addSublayer(oval)
        layers["oval"] = oval
        
        let ball = CAShapeLayer()
        self.layer.addSublayer(ball)
        layers["ball"] = ball
        
        let polygon = CALayer()
        self.layer.addSublayer(polygon)
        layers["polygon"] = polygon
        
        let eclipse = CAShapeLayer()
        self.layer.addSublayer(eclipse)
        layers["eclipse"] = eclipse
        
        resetLayerProperties(forLayerIdentifiers: nil)
        setupLayerFrames()
    }
    
    func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if layerIds == nil || layerIds.contains("rectangle"){
            let rectangle = layers["rectangle"] as! CAShapeLayer
            rectangle.fillColor   = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
            rectangle.strokeColor = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
        }
        if layerIds == nil || layerIds.contains("oval"){
            let oval = layers["oval"] as! CAShapeLayer
            oval.fillColor   = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
            oval.strokeColor = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
        }
        if layerIds == nil || layerIds.contains("ball"){
            let ball = layers["ball"] as! CAShapeLayer
            ball.fillColor   = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
            ball.strokeColor = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
        }
        if layerIds == nil || layerIds.contains("polygon"){
            let polygon = layers["polygon"] as! CALayer
            polygon.contents = UIImage(named:"polygon")?.cgImage
        }
        if layerIds == nil || layerIds.contains("eclipse"){
            let eclipse = layers["eclipse"] as! CAShapeLayer
            eclipse.fillColor   = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
            eclipse.strokeColor = UIColor(red:1, green: 0.596, blue:0.122, alpha:1).cgColor
        }
        
        CATransaction.commit()
    }
    
    func setupLayerFrames(){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if let rectangle : CAShapeLayer = layers["rectangle"] as? CAShapeLayer{
            rectangle.frame = CGRect(x: -0.00133 * rectangle.superlayer!.bounds.width, y: 0.64596 * rectangle.superlayer!.bounds.height, width:  rectangle.superlayer!.bounds.width, height: 0.38024 * rectangle.superlayer!.bounds.height)
            rectangle.path  = rectanglePath(bounds: (layers["rectangle"] as! CAShapeLayer).bounds).cgPath
        }
        
        if let oval : CAShapeLayer = layers["oval"] as? CAShapeLayer{
            oval.frame = CGRect(x: 0.4423 * oval.superlayer!.bounds.width, y: 0.25429 * oval.superlayer!.bounds.height, width: 0.11539 * oval.superlayer!.bounds.width, height: 0.06495 * oval.superlayer!.bounds.height)
            oval.path  = ovalPath(bounds: (layers["oval"] as! CAShapeLayer).bounds).cgPath
        }
        
        if let ball : CAShapeLayer = layers["ball"] as? CAShapeLayer{
            ball.frame = CGRect(x: 0.4423 * ball.superlayer!.bounds.width, y: 0.68468 * ball.superlayer!.bounds.height, width: 0.11539 * ball.superlayer!.bounds.width, height: 0.06495 * ball.superlayer!.bounds.height)
            ball.path  = ballPath(bounds: (layers["ball"] as! CAShapeLayer).bounds).cgPath
        }
        
        if let polygon : CALayer = layers["polygon"] as? CALayer{
            polygon.frame = CGRect(x: 0.39628 * polygon.superlayer!.bounds.width, y: 0.22089 * polygon.superlayer!.bounds.height, width: 0.20479 * polygon.superlayer!.bounds.width, height: 0.13174 * polygon.superlayer!.bounds.height)
        }
        
        if let eclipse : CAShapeLayer = layers["eclipse"] as? CAShapeLayer{
            eclipse.frame = CGRect(x: 0.39694 * eclipse.superlayer!.bounds.width, y: 0.6399 * eclipse.superlayer!.bounds.height, width: 0.21011 * eclipse.superlayer!.bounds.width, height: 0.03144 * eclipse.superlayer!.bounds.height)
            eclipse.path  = eclipsePath(bounds: (layers["eclipse"] as! CAShapeLayer).bounds).cgPath
        }
        
        CATransaction.commit()
    }
    
    //MARK: - Animation Setup
    
    func addRisingAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = 1.408
            completionAnim.delegate = self
            completionAnim.setValue("Rising", forKey:"animId")
            completionAnim.setValue(false, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"Rising")
            if let anim = layer.animation(forKey: "Rising"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : String = kCAFillModeForwards
        
        let oval = layers["oval"] as! CAShapeLayer
        
        ////Oval animation
        let ovalPositionAnim      = CAKeyframeAnimation(keyPath:"position")
        ovalPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.5 * oval.superlayer!.bounds.width, y: 0.28676 * oval.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.5 * oval.superlayer!.bounds.width, y: 0.28676 * oval.superlayer!.bounds.height))]
        ovalPositionAnim.keyTimes = [0, 1]
        ovalPositionAnim.duration = 1
        
        let ovalTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        ovalTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                       NSValue(caTransform3D: CATransform3DMakeScale(0, 0, 0))]
        ovalTransformAnim.keyTimes  = [0, 1]
        ovalTransformAnim.duration  = 0.162
        ovalTransformAnim.beginTime = 1
        
        let ovalRisingAnim : CAAnimationGroup = QCMethod.group(animations: [ovalPositionAnim, ovalTransformAnim], fillMode:fillMode)
        oval.add(ovalRisingAnim, forKey:"ovalRisingAnim")
        
        let ball = layers["ball"] as! CAShapeLayer
        
        ////Ball animation
        let ballPositionAnim      = CAKeyframeAnimation(keyPath:"position")
        ballPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.5 * ball.superlayer!.bounds.width, y: 0.71715 * ball.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.5 * ball.superlayer!.bounds.width, y: 0.28668 * ball.superlayer!.bounds.height))]
        ballPositionAnim.keyTimes = [0, 1]
        ballPositionAnim.duration = 1
        
        let ballTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        ballTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                       NSValue(caTransform3D: CATransform3DMakeScale(0, 0, 0))]
        ballTransformAnim.keyTimes  = [0, 1]
        ballTransformAnim.duration  = 0.162
        ballTransformAnim.beginTime = 1
        
        let ballRisingAnim : CAAnimationGroup = QCMethod.group(animations: [ballPositionAnim, ballTransformAnim], fillMode:fillMode)
        ball.add(ballRisingAnim, forKey:"ballRisingAnim")
        
        let polygon = layers["polygon"] as! CALayer
        
        ////Polygon animation
        let polygonTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        polygonTransformAnim.values    = [NSValue(caTransform3D: CATransform3DMakeScale(0, 0, 1)),
                                          NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(2 * M_PI), 0, 0, -1))]
        polygonTransformAnim.keyTimes  = [0, 1]
        polygonTransformAnim.duration  = 0.603
        polygonTransformAnim.beginTime = 0.798
        
        let polygonOpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
        polygonOpacityAnim.values   = [0, 0, 1]
        polygonOpacityAnim.keyTimes = [0, 0.566, 1]
        polygonOpacityAnim.duration = 1.41
        
        let polygonRisingAnim : CAAnimationGroup = QCMethod.group(animations: [polygonTransformAnim, polygonOpacityAnim], fillMode:fillMode)
        polygon.add(polygonRisingAnim, forKey:"polygonRisingAnim")
        
        let eclipse = layers["eclipse"] as! CAShapeLayer
        
        ////Eclipse animation
        let eclipseTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        eclipseTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                          NSValue(caTransform3D: CATransform3DMakeScale(0.5, 1, 1))]
        eclipseTransformAnim.keyTimes  = [0, 1]
        eclipseTransformAnim.duration  = 0.238
        eclipseTransformAnim.beginTime = 0.107
        
        let eclipsePositionAnim       = CAKeyframeAnimation(keyPath:"position")
        eclipsePositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.50199 * eclipse.superlayer!.bounds.width, y: 0.66243 * eclipse.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.50199 * eclipse.superlayer!.bounds.width, y: 0.64371 * eclipse.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.50199 * eclipse.superlayer!.bounds.width, y: 0.7485 * eclipse.superlayer!.bounds.height))]
        eclipsePositionAnim.keyTimes  = [0, 0.286, 1]
        eclipsePositionAnim.duration  = 0.555
        eclipsePositionAnim.beginTime = 0.107
        
        let eclipseRisingAnim : CAAnimationGroup = QCMethod.group(animations: [eclipseTransformAnim, eclipsePositionAnim], fillMode:fillMode)
        eclipse.add(eclipseRisingAnim, forKey:"eclipseRisingAnim")
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
        if identifier == "Rising"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval"] as! CALayer).animation(forKey: "ovalRisingAnim"), theLayer:(layers["oval"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["ball"] as! CALayer).animation(forKey: "ballRisingAnim"), theLayer:(layers["ball"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["polygon"] as! CALayer).animation(forKey: "polygonRisingAnim"), theLayer:(layers["polygon"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["eclipse"] as! CALayer).animation(forKey: "eclipseRisingAnim"), theLayer:(layers["eclipse"] as! CALayer))
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "Rising"{
            (layers["oval"] as! CALayer).removeAnimation(forKey: "ovalRisingAnim")
            (layers["ball"] as! CALayer).removeAnimation(forKey: "ballRisingAnim")
            (layers["polygon"] as! CALayer).removeAnimation(forKey: "polygonRisingAnim")
            (layers["eclipse"] as! CALayer).removeAnimation(forKey: "eclipseRisingAnim")
        }
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            (layer as! CALayer).removeAllAnimations()
        }
    }
    
    //MARK: - Bezier Path
    
    func rectanglePath(bounds: CGRect) -> UIBezierPath{
        let rectanglePath = UIBezierPath(rect:bounds)
        return rectanglePath
    }
    
    func ovalPath(bounds: CGRect) -> UIBezierPath{
        let ovalPath = UIBezierPath(ovalIn:bounds)
        return ovalPath
    }
    
    func ballPath(bounds: CGRect) -> UIBezierPath{
        let ballPath = UIBezierPath(ovalIn:bounds)
        return ballPath
    }
    
    func eclipsePath(bounds: CGRect) -> UIBezierPath{
        let eclipsePath = UIBezierPath(ovalIn:bounds)
        return eclipsePath
    }
    
    
}
