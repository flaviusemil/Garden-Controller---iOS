//
//  ViewController.swift
//  Garden Controller
//
//  Created by Flavius Condurache on 03/09/2017.
//  Copyright © 2017 Flavius Condurache. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleLed(_ sender: Any) {
        print("Toggleing led state")
        
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        let mqtt = CocoaMQTT(clientID: clientID, host: "localhost", port: 1883)
        mqtt.username = "test"
        mqtt.password = "public"
        mqtt.willMessage = CocoaMQTTWill(topic: "/will", message: "dieout")
        mqtt.keepAlive = 60
        mqtt.delegate = self
        mqtt.connect()
    }

}

