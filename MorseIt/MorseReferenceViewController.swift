//
//  MorseReferenceViewController.swift
//  MorseIt
//
//  Created by Robert Ahlberg on 2019-12-08.
//  Copyright © 2019 Robert Ahlberg. All rights reserved.
//

import UIKit

class MorseReferenceViewController: UIViewController {
  
  
  @IBOutlet weak var referenceTextView: UITextView!
  var morseCodes: [String: String]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var referenceText = ""
    for (signal, letter) in morseCodes! {
      referenceText += "\(signal) : \(letter)\n"
    }
    
    referenceTextView.text = referenceText
    
  }
  
  @IBAction func dismissViewController(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}
