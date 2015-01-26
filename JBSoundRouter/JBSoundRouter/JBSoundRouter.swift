//
//  JBSoundRouter.swift
//
//  Created by Josip Bernat on 1/26/15.
//  Copyright (c) 2015 Josip-Bernat. All rights reserved.
//

import Foundation
import AVFoundation

enum JBSoundRoute: Int {

    case Speaker = 0
    case PhoneSpeaker
}

@objc class JBSoundRouter: NSObject {

    class func routeSound(route: JBSoundRoute) {
    
        let instance: JBSoundRouter = self.sharedInstance
        instance.currentRoute = route
    }
    
    //MARK: Shared Instance
    //MARK:
    
    private class var sharedInstance : JBSoundRouter {
        
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : JBSoundRouter? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = JBSoundRouter()
        }
        return Static.instance!
    }
    
    //MARK: Initialization
    //MARK:
    
    override init() {
        
        super.init();
        
        // Use mainQueue because in other case bad thing happens...
        NSNotificationCenter.defaultCenter().addObserverForName(
            AVAudioSessionRouteChangeNotification,
            object: nil,
            queue: NSOperationQueue.mainQueue()) { (note) -> Void in
                
                if AVAudioSession.sharedInstance().category != AVAudioSessionCategoryPlayback && self.currentRoute == JBSoundRoute.Speaker {
                    self.currentRoute = JBSoundRoute.Speaker
                }
                else if AVAudioSession.sharedInstance().category != AVAudioSessionCategoryPlayAndRecord && self.currentRoute == JBSoundRoute.PhoneSpeaker {
                    self.currentRoute = JBSoundRoute.PhoneSpeaker
                }
        }
    }

    //MARK: Setters
    //MARK:
    
    private var currentRoute: JBSoundRoute = JBSoundRoute.Speaker {
    
        didSet {
            self.__routeSound(currentRoute)
        }
    }
    
    //MARK: Routing
    //MARK:
    
    private func __routeSound(route: JBSoundRoute) -> Bool {
    
        var categoryError: NSError? = nil
        var session: AVAudioSession = AVAudioSession.sharedInstance()
        
        if route == JBSoundRoute.PhoneSpeaker {
            session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: &categoryError)
        }
        else if route == JBSoundRoute.Speaker {
            session.setCategory(AVAudioSessionCategoryPlayback, error: &categoryError)
        }
        
        if categoryError != nil {
            JBLog(String(format: "categoryError: %@", categoryError!))
        }
        
        var activationError: NSError? = nil
        var successfull: Bool = session.setActive(true, error: &activationError)
        
        if activationError != nil {
            JBLog(String(format: "activationError: %@", activationError!))
        }
        
        JBLog(String(format: "successfull: %@", successfull.description))
        
        return successfull
    }
    
    //MARK: Logging
    //MARK:
    
    func JBLog(message: String, function: String = __FUNCTION__) {
        #if DEBUG
            println("\(function): \(message)")
        #endif
    }
}
