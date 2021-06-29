//
//  ThirdViewController.swift
//  ScrollViewTest
//
//  Created by Mikhail on 28.05.2021.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var pulseLayer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        basicAnimationExample()
        anotherAnimation()
        yetAnotherAnimation()
    }

    private func basicAnimationExample() {
        CATransaction.begin()
            CATransaction.setCompletionBlock({ [weak self] in
                self?.pulseLayer.isHidden = true
            })
        let animation = CABasicAnimation(keyPath: "position")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 5
        animation.fromValue = NSValue(cgPoint: CGPoint(x: 0, y: 0))
        animation.toValue = NSValue(cgPoint: CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height))
        animation.fillMode = .forwards
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        pulseLayer.layer.add(animation, forKey: "position")
        CATransaction.commit()
    }
    
    private func anotherAnimation() {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 5
        animation.fromValue = view.layer.transform
        animation.autoreverses = false
        animation.toValue = CATransform3DMakeRotation(.pi, 0, 0, 1)
        view.layer.add(animation, forKey: "rotate")
    }
    
    private func yetAnotherAnimation() {
        
        let customView = UIView(frame: CGRect(x: 100, y: 0, width: 20, height: 200))
        customView.backgroundColor = .green
        customView.layer.cornerRadius = 10
        view.addSubview(customView)
        
        var animations = [CAKeyframeAnimation]()
        
        let animation1 = CAKeyframeAnimation()
        animation1.keyPath = "position.y"
        animation1.values = [0, UIScreen.main.bounds.height, 0]
        animation1.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation1.duration = 3
        animation1.isAdditive = true
        animations.append(animation1)
        
        let animation2 = CAKeyframeAnimation()
        animation2.keyPath = "position.x"
        animation2.values = [0, 10, -10, 10, -5, 5, -5, 0]
        animation2.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation2.duration = 0.5
        animation2.isAdditive = true
        animations.append(animation2)
        
        let snakeAnimation = CAAnimationGroup()
        snakeAnimation.duration = 3.0
        snakeAnimation.repeatCount = .greatestFiniteMagnitude
        snakeAnimation.fillMode = .both
        snakeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        snakeAnimation.animations = animations
            
        customView.layer.add(snakeAnimation, forKey: nil)
    }
}
