//
//  ViewController.swift
//  How to play sound when a button is pressed
//
//  Created by James Taylor on 06/04/2019.
//  Copyright © 2019 James Rea Taylor. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer : AVAudioPlayer!
    var soundName = "sound"

    let soundButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press to play sound", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.darkGray
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(handlePlaySound), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(soundButton)
        
        soundButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        soundButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        soundButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        soundButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        soundButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func handlePlaySound() {
        let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        }
        catch {
            print("Error locating sound file: \(error)")
        }
    }
}

