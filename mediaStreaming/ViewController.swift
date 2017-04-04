//
//  ViewController.swift
//  mediaStreaming
//
//  Created by Alex on 4/3/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playerLayer: BMPlayerLayerView!

    @IBOutlet weak var slider: BMTimeSlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    fileprivate var totalDuration   : TimeInterval = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://raw.githubusercontent.com/futomtom/media/master/Call%20Me%20Maybe.mp3")!
        let asset = AVURLAsset(url: url, options: nil)
        playerLayer.delegate = self
        playerLayer.playAsset(asset: asset)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
  
    
    fileprivate func formatSecondsToString(_ secounds: TimeInterval) -> String {
        let Min = Int(secounds / 60)
        let Sec = Int(secounds.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", Min, Sec)
    }
}


extension ViewController: BMPlayerLayerViewDelegate {
  /*  public func bmPlayer(player: BMPlayerLayerView, playerIsPlaying playing: Bool) {
       
    }
    */

  
    
    
    
    public func bmPlayer(player: BMPlayerLayerView, playerStateDidChange state: BMPlayerState) {
       
      
        
    
    }
    
    
    
    func playTimeDidChange(currentTime: TimeInterval, totalTime: TimeInterval) {
        currentTimeLabel.text = formatSecondsToString(currentTime)
        totalDurationLabel.text = formatSecondsToString(totalTime)
        slider.value    = Float(currentTime) / Float(totalTime)
        
    }
}
