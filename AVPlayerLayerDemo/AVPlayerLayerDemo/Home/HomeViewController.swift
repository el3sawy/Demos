//
//  HomeViewController.swift
//  AVPlayerLayerDemo
//
//  Created by Ahmed Elesawy on 11/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnPlayOutlets: UIButton!
    @IBOutlet weak var viewPlayer: PlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "AhmedNaguib", withExtension: "mov")!
        viewPlayer.initPlayer(url: url)
    }
    
    @IBAction func btnPlayTapped(_ sender: Any) {
        viewPlayer.isVideoPlaying.toggle()
        let status = viewPlayer.isVideoPlaying
        let title = status ? "Pause" : "Play"
        btnPlayOutlets.setTitle(title, for: .normal)
        
    }
}
