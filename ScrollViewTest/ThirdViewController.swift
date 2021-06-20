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
}
