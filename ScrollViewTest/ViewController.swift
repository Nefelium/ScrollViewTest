//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Mikhail on 07.02.2021.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        rectRotateExample()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("frame \(scrollView.layer.frame)")
        print("bounds \(scrollView.layer.bounds)")
    }
    
    func rectRotateExample() {
        let frame = CGRect(x: 16, y: 400, width: 250, height: 30)
        let myLabel = UILabel(frame: frame)
        myLabel.backgroundColor = .systemIndigo
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.text = "CGRect transform example"
        view.addSubview(myLabel)
        myLabel.transform = CGAffineTransform(rotationAngle: 45)
    }
}
