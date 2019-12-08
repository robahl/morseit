//
//  ViewController.swift
//  MorseIt
//
//  Created by Robert Ahlberg on 2019-12-04.
//  Copyright © 2019 Robert Ahlberg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var player: AVAudioPlayer?
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Initialize audio player
    guard let url = Bundle.main.url(forResource: "beep", withExtension: "wav") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
      try AVAudioSession.sharedInstance().setActive(true)
      
      player = try AVAudioPlayer(contentsOf: url)
      
    } catch let error {
      print(error.localizedDescription)
    }
  }

  @IBAction func signalTouchedDown(_ sender: Any) {
    player?.play()
    signalDownTime = Date().timeIntervalSince1970
    if (signalDownTime - signalUpTime) > (dotDuration * 5) {
      morseSequence.append(" ")
    }
  }
  
  @IBAction func signalTouchedUp(_ sender: Any) {
    player?.stop()
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

