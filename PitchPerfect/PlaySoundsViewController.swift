//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Elina Mansurova on 2020-08-11.
//  Copyright © 2020 Elina Mansurova. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioFile: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slowButton = 0, fastButton, highPitchButton, lowPitchButton, echoButton, reverbButton
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slowButton:
            playSound (rate: 0.5)
        case .fastButton:
            playSound (rate: 2.0)
        case .highPitchButton:
            playSound (pitch: 1000)
        case .lowPitchButton:
            playSound (pitch: -1000)
        case .echoButton:
            playSound (echo: true)
        case .reverbButton:
            playSound (reverb: true)
        }
        
        configureUI(.playing)
    }
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

}
