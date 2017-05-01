//
//  ViewController.swift
//  Aadhaar eSign
//
//  Created by Balamurali Pandranki on 30/03/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var welcome: UITextField!
    var remoteConfig = FIRRemoteConfig.remoteConfig()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var remoteConfigSettings = FIRRemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.configSettings = remoteConfigSettings!
        
        //start developer mode
        remoteConfigSettings = FIRRemoteConfigSettings.init(developerModeEnabled: true)
        self.remoteConfig.configSettings = remoteConfigSettings!;
        
        remoteConfig.setDefaultsFromPlistFileName("RemoteConfig")
        
        fetchConfig()
       
    }
    
    func fetchConfig() {
      self.welcome.text = self.remoteConfig["loading_phrase"].stringValue;
        
    var expirationDuration = 3600;
    // If your app is using developer mode, expirationDuration is set to 0, so each fetch will
    // retrieve values from the Remote Config service.
    if (remoteConfig.configSettings.isDeveloperModeEnabled) {
    expirationDuration = 0;
    }
        
        remoteConfig.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
            } else {
                print("Config not fetched")
                print("Error \(error!.localizedDescription)")
            }
            self.displayWelcome()
        }
    }
    
    func displayWelcome(){
        var welcomeMessage = remoteConfig["welcome_message"].stringValue
        self.welcome.text = welcomeMessage;

    }
    
    @IBAction func pressForFetching(_ sender: Any) {
        self.fetchConfig()

    }

}

