//
//  ViewController.swift
//  MorseIt
//
//  Created by Robert Ahlberg on 2019-12-04.
//  Copyright © 2019 Robert Ahlberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func signalTouchedDown(_ sender: Any) {
    print("Down")
  }
  
  @IBAction func signalTouchedUp(_ sender: Any) {
    print("Up")
  }
}

