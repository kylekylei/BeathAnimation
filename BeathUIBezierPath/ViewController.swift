//
//  ViewController.swift
//  BeathUIBezierPath
//
//  Created by Kyle Lei on 2021/8/3.
//

import UIKit

class ViewController: UIViewController {
    
    func circleGroup(countOfCircle: Int, distant: CGFloat, rotateDegree: CGFloat) {
        
        let centerX = UIScreen.main.bounds.width * 0.5
        let centerY = UIScreen.main.bounds.height * 0.5
        let oneDegree = CGFloat.pi / 180
        let oneUnitDegree = oneDegree * 360 / CGFloat(countOfCircle)
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: 100, startAngle: 0, endAngle: 360, clockwise: true)
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

        
        for i in 0..<countOfCircle {
            let circleShape = CAShapeLayer()
            circleShape.path = path.cgPath
            
            let circleView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            circleView.backgroundColor = UIColor(displayP3Red: 0, green: 253/255, blue: 255/255, alpha: 0.38)
            circleView.layer.mask = circleShape
            circleView.transform = CGAffineTransform.identity.rotated(by: oneUnitDegree * CGFloat(i)).translatedBy(x: 0, y: -distant)
            
            subView.addSubview(circleView)
            
        }
        
        view.addSubview(subView)
        subView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180 * rotateDegree)
        
        let title = UILabel(frame: CGRect(x: 0, y: 750, width: UIScreen.main.bounds.width, height: 50))
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor.gray
        title.font = UIFont.systemFont(ofSize: 36)
        //title.text = "Breath"
        title.text = "\(countOfCircle)"
        view.addSubview(title)

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
          
        let animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear) {
            self.circleGroup(countOfCircle: 6, distant: 50, rotateDegree: 180)
            
            
        }
        animator.startAnimation()
        
    
       
               
    }
}

