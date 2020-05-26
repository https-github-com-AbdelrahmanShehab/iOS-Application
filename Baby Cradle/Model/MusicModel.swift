//
//  MusicModel.swift
//  Baby Cradle
//
//  Created by Abdelrahman Shehab on 5/15/20.
//  Copyright © 2020 Abdelrahman Shehab. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import Firebase

struct Music {

    private var isRepeated = false

    /// Setting Song Value in Real Time Database in Firebase
    func setMusicInRTDFirebase(with songValue: Int)
    {
        let refMusic = Database.database().reference(withPath: "Music")
        var refSong: DatabaseReference!
        refSong = refMusic.child("song")
        refSong.setValue(songValue)
    }

    /// Setting Song Volume in Real Time Database in Firebase
    func setVolumeRTDFirebase(with songVolume: Float)
    {
        let refMusic = Database.database().reference(withPath: "Music")
        var refVolume: DatabaseReference!
        refVolume = refMusic.child("volume")
        refVolume.setValue(songVolume)
    }

    /// Function to Change Play/Pause Button Image States
    func showPlayOrPauseButton(_ shouldShowPlayOrPauseButton: Bool, on button: UIButton) {
        let imageName = shouldShowPlayOrPauseButton ? "play" : "pause"

        button.setImage(UIImage(named: imageName), for: .normal)
    }

    /// Function to Repeat Song once Or Infinitely
    mutating func setRepeat(player: AVAudioPlayer,on button: UIButton) {

        if (player.isPlaying == true || player.isPlaying == false) && isRepeated == false{
            player.numberOfLoops = 1
            button.setImage(UIImage(systemName: "repeat.1"), for: .normal)
        } else if (player.isPlaying == true || player.isPlaying == false) && isRepeated == true
        {
            player.numberOfLoops = -1
            button.setImage(UIImage(systemName: "repeat"), for: .normal)
        }
        isRepeated = !isRepeated
    }

    /// Function to Mute Or Unmute Song
    func setMuteOrUnMute(player: AVAudioPlayer,on button: UIButton)
    {
        if player.volume > 0 {
            player.volume = 0
            button.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        } else {
            player.volume = 0.5
            button.setImage(UIImage(systemName: "speaker.2.fill"), for: .normal)

        }
    }

    /// Show Play Or Pause button Image Function
    func setPlayOrPauseButtonImage(_ isPressed: Bool, on button: UIButton) {
        if isPressed == true {
            showPlayOrPauseButton(!isPressed, on: button)
        } else {
            showPlayOrPauseButton(!isPressed, on: button)
        }
    }

    /// Show  Pause button Of Selected Cell
    func setPauseButtonOnSelectedCell(_ isPressed: Bool, on button: UIButton) {
        if isPressed == true {
            showPlayOrPauseButton(!isPressed, on: button)
        } else {
            showPlayOrPauseButton(isPressed, on: button)
        }
    }
}
