//
//  MusicController.swift
//  Ekko
//
//  Created by Lucas Goldner on 08.04.23.
//

import Foundation
import MediaPlayer
import SwiftUI

class MusicController: ObservableObject {
    @Published var currentSongTitle: String?
    @Published var currentSongArtwork: UIImage?

    func checkForCurrentSong() {
        NotificationCenter.default.addObserver(forName: .MPMusicPlayerControllerNowPlayingItemDidChange, object: nil, queue: .main) { [self] notification in
            if let nowPlaying = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem {
                self.currentSongTitle = nowPlaying.title
                self.currentSongArtwork = nowPlaying.artwork?.image(at: CGSize(width: 200, height: 200))
            } else {
                self.currentSongTitle = nil
                self.currentSongArtwork = nil
            }
        }
        
        if let nowPlaying = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem {
            currentSongTitle = nowPlaying.title
            currentSongArtwork = nowPlaying.artwork?.image(at: CGSize(width: 200, height: 200))
        } else {
            currentSongTitle = nil
            currentSongArtwork = nil
        }
    }
    
    func scratchAccordingToRotationAngle(rotationAngle: Angle) {
        print(rotationAngle.degrees)
    }
}
