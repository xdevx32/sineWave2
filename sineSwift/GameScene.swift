//
//  GameScene.swift
//  sineSwift
//
//  Created by Angel Kukushev on 10/12/15.
//  Copyright (c) 2015 xdevx332. All rights reserved.
//
import UIKit
import SpriteKit


// Defined at global scope.
let π = CGFloat(M_PI)
var x: CGFloat = -20.0
let y: CGFloat = 390.0
//var sliderDemo = UISlider(frame:CGRectMake(20, 260, 280, 20))
var amplitudeEe:CGFloat = 100.0

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
       
        let node = SKShapeNode(circleOfRadius: 15)
        node.strokeColor = UIColor.blackColor()
        
        node.position = CGPoint(x:370, y: size.height / 2 + 15.0)
        self.addChild(node)
        let actionMoveTo = SKAction.moveByX(0.0, y: 0.0, duration: 100.0)
        node.runAction(actionMoveTo)
        let oscillate = SKAction.oscillation(amplitude: 200, timePeriod: 10, midPoint: node.position)
        node.runAction(SKAction.repeatActionForever(oscillate))
    
    
//        
//        sliderDemo = UISlider(frame:CGRectMake(20, 260, 280, 20))
//        sliderDemo.minimumValue = 100.0
//        sliderDemo.maximumValue = 200.0
//        sliderDemo.continuous = true
//        sliderDemo.value = 150.0
//        sliderDemo.addTarget(amplitudeEe, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
//        self.view?.addSubview(sliderDemo)
//        
        
        
        
        
    }
//    @IBAction func sliderValueDidChange(sender: UISlider) {
//   
//        print("value--\(sender.value)")
//      
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
       
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        let sinWave = SKShapeNode()
        sinWave.position = CGPointMake(x, y)
        sinWave.path = sineWaveWithAmplitude(amplitude: 200.0, frequency: 100.0, width: 200.0, centered: true, andNumPoints: 100.0);
        sinWave.strokeColor = SKColor.grayColor()
        sinWave.runAction(SKAction.moveByX(-2000.0, y: 0.0, duration: 100.0))
        self.addChild(sinWave)
           x = x+195.1;
    }
    func sineWaveWithAmplitude(amplitude amp: CGFloat,frequency freq:CGFloat,width:CGFloat,centered:Bool,andNumPoints numPoints:CGFloat) -> CGMutablePathRef{
        var offsetX = 0.0;
        var offsetY = amp;
        
        if (centered) {
            offsetX = 0.0;
            offsetY = 0;
        }

        let path: CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0.0 , 0.0);
        let xIncr: CGFloat = 2.0
        let counter:Int = Int(numPoints)
        for i in 1..<counter {
            let yC = amp * sin(CGFloat(i) * π * 2.0 / 100.0)
            CGPathAddLineToPoint(path, nil, CGFloat(i)*xIncr-2.5, yC+15.0);
        }
        
        return path
    }
}
extension SKAction {
    static func oscillation(amplitude a: CGFloat, timePeriod t: CGFloat, midPoint: CGPoint) -> SKAction {
        let action = SKAction.customActionWithDuration(Double(t)) { node, currentTime in
            let displacement = a * sin(2 * π * currentTime / t)
            node.position.y = midPoint.y + displacement
        }
        
        return action
    }
}
