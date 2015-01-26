//
//  ViewController.swift
//  JBSoundRouter
//
//  Created by Josip Bernat on 1/26/15.
//  Copyright (c) 2015 Josip Bernat. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var audioPlayer: AVAudioPlayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let delayTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
            
            var path: String = NSBundle.mainBundle().pathForResource("ringing_voice", ofType: "mp3")!
            var data: NSData = NSData(contentsOfFile: path)!
            
            var playerError: NSError? = nil
            var player: AVAudioPlayer = AVAudioPlayer(data: data, error: &playerError)
            player.prepareToPlay()
            player.play()
            
            self.audioPlayer = player
            
            self.onRouteToSpeaker(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRouteToSpeaker(sender: AnyObject) {
    
        JBSoundRouter.routeSound(JBSoundRoute.Speaker)
    }

    @IBAction func onRouteToPhoneSpeaker(sender: AnyObject) {
    
        JBSoundRouter.routeSound(JBSoundRoute.PhoneSpeaker)
    }
}

