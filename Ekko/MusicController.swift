//
//  MusicController.swift
//  Ekko
//
//  Created by Lucas Goldner on 08.04.23.
//

import Foundation
import MediaPlayer
import AVFoundation
import SwiftUI

class MusicController: ObservableObject {
    @Published var currentSongTitle: String?
    @Published var currentSongArtwork: UIImage?
    private var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
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
    
    func scratchAccordingToRotationAngle(degrees: CGSize) {
        
        let valueToSkipBy : Double = (-degrees.width) / 10
        let musicPlayerController = MPMusicPlayerController.systemMusicPlayer
        let playbackTime = musicPlayerController.currentPlaybackTime
        playScratchSound()
        musicPlayerController.currentPlaybackTime = max(playbackTime + valueToSkipBy, 0)
    }
    
    func playScratchSound() {
        guard let url = Bundle.main.url(forResource: "scratch_0", withExtension: "mp3") else { return }
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, options: .mixWithOthers)
            try session.setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
