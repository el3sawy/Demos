//
//  ProgressViewController.swift
//  LayoutTests
//
//  Created by Ahmed Naguib on 16/11/2023.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var firstStepView: UIView!
    @IBOutlet weak var secondStepView: UIView!
    @IBOutlet weak var thirdStepView: UIView!
    @IBOutlet weak var fourthStepView: UIView!
    private var leadingConstraint: NSLayoutConstraint!
    let animatedView = UIView()
    let animationKey = "myAnimationKey"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [firstStepView, secondStepView, thirdStepView, fourthStepView].forEach({
            $0.backgroundColor = .black.withAlphaComponent(0.1)
        })
        
        // Start the fill animation
        
        
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //            self.leadingConstraint.constant = 0
        //        }
        
        
    }
    
    @IBAction func bnt(_ sender: Any) {
        fillAnimator?.stopAnimation(true)
        self.setAnimatedView(on: self.thirdStepView)
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.setAnimatedView(on: self.secondStepView)
        //        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    
    private func setAnimatedView(on currentView: UIView) {
        
        animatedView.backgroundColor = .clear
        currentView.addSubview(animatedView)
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalToConstant: 5),
            animatedView.leadingAnchor.constraint(equalTo: currentView.leadingAnchor),
        ])
        
        leadingConstraint = animatedView.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: 0)
        leadingConstraint.isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.leadingConstraint.constant = -currentView.frame.width
            self.animatedView.backgroundColor = .red
            self.view.layoutIfNeeded()
            self.startFillAnimation(on: currentView)
        }
    }
    
    private var fillAnimator: UIViewPropertyAnimator?

    private func startFillAnimation(on currentView: UIView) {
        // Make sure to check if the animator is not already running
        guard fillAnimator?.state != .active else {
            return
        }

        // First part of the animation
        fillAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .linear) {
            self.animatedView.backgroundColor = UIColor.red
            let width = currentView.frame.width - (currentView.frame.width * 0.9)
            self.leadingConstraint.constant = -width
            self.view.layoutIfNeeded()
        }

        fillAnimator?.addCompletion { _ in
            // Second part of the animation
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.0, options: [], animations: {
                self.animatedView.backgroundColor = .red.withAlphaComponent(0.0)
                self.view.layoutIfNeeded()
            }) { _ in
                // Repeat the animation
                self.leadingConstraint.constant = -currentView.frame.width
                self.view.layoutIfNeeded()
                self.startFillAnimation(on: currentView)
            }
        }

        // Start the animation
        fillAnimator?.startAnimation()
    }

    // To stop the animation
    private func stopFillAnimation() {
        fillAnimator?.stopAnimation(true)
    }

    
//    private func startFillAnimation(on currentView: UIView) {
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveLinear], animations: {
//            self.animatedView.backgroundColor = UIColor.red
//            let width = currentView.frame.width - ( currentView.frame.width * 0.9)
//            self.leadingConstraint.constant = -width
//            self.view.layoutIfNeeded() // Trigger layout update
//        }, completion: { _ in
//            UIView.animate(withDuration: 1.0, animations: {
//                self.animatedView.backgroundColor = .red.withAlphaComponent(0.0)
//                
//                self.view.layoutIfNeeded()
//            }) { _ in
//                // Repeat the animation
//                
//                self.leadingConstraint.constant = -currentView.frame.width
//                self.view.layoutIfNeeded()
//                self.startFillAnimation(on: currentView)
//            }
//        })
//    }
    
    
}

