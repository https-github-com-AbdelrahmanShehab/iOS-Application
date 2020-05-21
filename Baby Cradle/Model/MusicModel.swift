//
//  MusicModel.swift
//  Baby Cradle
//
//  Created by Abdelrahman Shehab on 5/15/20.
//  Copyright © 2020 Abdelrahman Shehab. All rights reserved.
//

import Foundation
import UIKit
import Firebase

struct Music {

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
}
