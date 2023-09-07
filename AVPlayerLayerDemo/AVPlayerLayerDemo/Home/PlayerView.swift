//
//  PlayerView.swift
//  AVPlayerLayerDemo
//
//  Created by Ahmed Elesawy on 11/10/2022.
//

import UIKit
import AVFoundation

class PlayerView: UIView {
    var isVideoPlaying = false {
        didSet {
            isVideoPlaying ? pause() : play()
        }
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    var player: AVPlayer? {
        get { return playerLayer.player }
        set { playerLayer.player = newValue }
    }
    
    func initPlayer(url: URL) {
        player = AVPlayer(url: url)
        play()
    }
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
}
