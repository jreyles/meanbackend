//
//  ViewController.swift
//  meanPrac
//
//  Created by Jonathan Reyles on 3/18/16.
//  Copyright © 2016 Jonathan Reyles. All rights reserved.
//

import UIKit
import Foundation
//import SocketIOClientSwift

class ViewController: UIViewController {
    // use your Heroku acccount as the socketURL
    // if you didn't use Heroku your link would be http://localhost:3000
//    let socket = SocketIOClient(socketURL: NSURL(fileURLWithPath: "http://localhost:5000")!, options: [.Log(true), .ForcePolling(true)]))

    let socket = SocketIOClient(socketURL: NSURL(string: "http://192.168.1.48:3000")!, options: [.Log(true), .ForcePolling(true)])
    override func viewDidLoad() {
        super.viewDidLoad()
        print(socket)
        print("hello")
        print(socket.connect())
        socket.on("connect") { data, ack in
            print("iOS::WE ARE USING SOCKETS!")
        }
        socket.connect()
    }
    
    @IBAction func yellowButtonPressed(sender: UIButton){
        print("javascript")
        socket.emit("javascript")
    }
    @IBAction func orangeButtonPressed(sender: UIButton){
        print("swift")
        socket.emit("swift")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


