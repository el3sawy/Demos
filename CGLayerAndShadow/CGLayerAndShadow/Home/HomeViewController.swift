//
//  HomeViewController.swift
//  CGLayerAndShadow
//
//  Created by Ahmed Elesawy on 12/10/2022.
//

import UIKit
// https://www.hackingwithswift.com/articles/155/advanced-uiview-shadow-effects-using-shadowpath
class HomeViewController: UIViewController {

    @IBOutlet weak var viewTest: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class CustomView: UIView {
    
    let height: CGFloat = 120
    let width: CGFloat = 120
    
    override func awakeFromNib() {
        setupShadow()


    }
    
    func shadow1() {
        let shadowSize: CGFloat = 20
        let contactRect = CGRect(x: -shadowSize, y: height - (shadowSize * 0.4), width: width + shadowSize * 2, height: shadowSize)
        layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4
    }
    private func setupShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 15)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3 // 0 to 1.0
        layer.shadowColor = UIColor.red.cgColor
        //use this should only be use on views that are static increase the performance
        
        // Static mean that have fixed width and height
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
        
//        layer.shadowPath = CGPath(rect: bounds, transform: nil)
        
//        layer.shadowPath = self.customShadowPath(viewLayer: layer, shadowHeight: 5).cgPath
//        layer.isGeometryFlipped = false
    }
    
    private func customShadowPath(viewLayer layer: CALayer,
                                  shadowHeight: CGFloat) -> UIBezierPath {
        let layerX = layer.bounds.origin.x
        let layerY = layer.bounds.origin.y
        let layerWidth = layer.bounds.size.width
        let layerHeight = layer.bounds.size.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        
        path.addLine(to: CGPoint(x: layerX + layerWidth,
                                 y: layerY))
        path.addLine(to: CGPoint(x: layerX + layerWidth,
                                 y: layerHeight + 20))
        
        
        path.addCurve(to: CGPoint(x: 0,
                                  y: layerHeight),
                      controlPoint1: CGPoint(x: layerX + layerWidth,
                                             y: layerHeight),
                      controlPoint2: CGPoint(x: layerX,
                                             y: layerHeight))
        
        return path
    }
}

