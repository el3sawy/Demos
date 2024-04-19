//
//  HomeViewController.swift
//  LayoutTests
//
//  Created by Ahmed Elesawy on 09/10/2022.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {

    @IBOutlet weak var LBL: UILabel!
    @IBOutlet weak var animationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let stringArray = ["Item 1", "Item 2", "Item 3", "Item 4"]

        let concatenatedString = stringArray.joined(separator: "\n")
        
        LBL.text = concatenatedString
        LBL.font = .systemFont(ofSize: 30)
        
//        let x = LottieAnimationView(name: <#T##String#>)
//
//        animationView.backgroundColor = .white
//        animationView.loopMode = .loop
//        animationView.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
////        animationView.animationName = ""
//        let animationLottie = LottieAnimationView(name: "square_animation") // Replace with your JSON file name
//        animationLottie.frame = animationView.frame
////        animationLottie.frame = CGRect(x: 0, y: 0, width: animationView.frame.width, height:  animationView.frame.height)
//        animationLottie.center = animationView.center
//        animationLottie.loopMode = .loop // You can set the loop mode as needed
//        animationLottie.clipsToBounds = true
//        animationView.addSubview(animationLottie)

//        animationLottie.play()
        
        animationView.backgroundColor = .purple
        
        
        let gradientLayer = CAGradientLayer()

        // Set the colors with the same color for both stops
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.red.cgColor]

        // Set the locations to achieve the desired percentage split
//        gradientLayer.locations = [0.7, 1.0]

        // Set the frame of the layer
        let x = animationView.frame.width * 0.90
        gradientLayer.frame = CGRect(x: 0, y: 0, width: x, height: animationView.frame.height)

        animationView.layer.addSublayer(gradientLayer)
    }
}
