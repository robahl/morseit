//
//  ViewController.swift
//  MorseIt
//
//  Created by Robert Ahlberg on 2019-12-04.
//  Copyright © 2019 Robert Ahlberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var morseSequence = [String]()
  var signalDownTime: TimeInterval = 0.0
  var signalUpTime: TimeInterval = 0.0
  let dotDuration = 0.12 // 150 ms
  
  let morseCodes = [
    ".-": "A",
    "-...": "B",
    "-.-.": "C",
    "-..": "D",
    ".": "E",
    "..-.": "F",
    "--.": "G",
    "....": "H",
    "..": "I",
    ".---": "J",
    "-.-": "K",
    ".-..": "L",
    "--": "M",
    "-.": "N",
    "---": "O",
    ".--.": "P",
    "--.-": "Q",
    ".-.": "R",
    "...": "S",
    "-": "T",
    "..-": "U",
    "...-": "V",
    ".--": "W",
    "-..-": "X",
    "-.--": "Y",
    "--..": "Z"
  ]
  @IBOutlet weak var messageLabel: UILabel!

  @IBAction func signalTouchedDown(_ sender: Any) {
    signalDownTime = Date().timeIntervalSince1970
    if (signalDownTime - signalUpTime) > (dotDuration * 5) {
      morseSequence.append(" ")
    }
  }
  
  @IBAction func signalTouchedUp(_ sender: Any) {
    signalUpTime = Date().timeIntervalSince1970
    let duration = signalUpTime - signalDownTime
    morseSequence.append(morseSignal(duration))
    
    messageLabel.text = morseSequenceToAlpha(morseSequence)
  }
  
  
  @IBAction func clearMessage(_ sender: Any) {
    messageLabel.text = ""
    morseSequence = []
  }
  
  func morseSignal(_ duration: TimeInterval) -> String {
    return duration >= 3 * dotDuration ? "-" : "."
  }
  
  func morseSequenceToAlpha(_ sequence: [String]) -> String {
    let morseCharacters = sequence.split(separator: " ").map({(character) -> String in
      return character.joined(separator: "")
    })
    
    return morseCharacters.map({(character) -> String in
      return (morseCodes[character] ?? "")
      }).joined(separator: "")
  }
}

