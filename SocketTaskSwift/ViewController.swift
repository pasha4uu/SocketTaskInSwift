//
//  ViewController.swift
//  SocketTaskSwift
//
//  Created by PASHA on 21/11/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {

  
  @IBOutlet weak var dataTF: UITextField!
  @IBOutlet weak var portTF: UITextField!
  @IBOutlet weak var ipTF: UITextField!
  let manager = SocketManager(socketURL: URL(string: "http://192.168.1.11:1100")!, config: [.log(true), .compress])
  override func viewDidLoad() {
    super.viewDidLoad()
//
    let socket = manager.defaultSocket
    
   //  let socket = SocketManager(socketURL: URL(string: "http://192.168.1.11:1100")!).defaultSocket
 
    socket.on(clientEvent: .connect) {data, ack in
      print("socket connected")
     
     
    }
    
   socket.connect()
     socket.emit("message", ["text":"helloppd pdo"])
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func sendTap(_ sender: Any) {
    
    manager.defaultSocket.emit("message", ["text":"\(self.dataTF.text ?? "hello !!")"])
//manager.connect()
  }
  
}

