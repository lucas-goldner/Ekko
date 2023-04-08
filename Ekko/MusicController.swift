//
//  MusicController.swift
//  Ekko
//
//  Created by Lucas Goldner on 08.04.23.
//

import Foundation
import MediaPlayer

class MusicController: ObservableObject {
    @Published var currentSongTitle: String?

    func checkForCurrentSong() {
        NotificationCenter.default.addObserver(forName: .MPMusicPlayerControllerNowPlayingItemDidChange, object: nil, queue: .main) { [self] notification in
            if let nowPlaying = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem {
                self.currentSongTitle = nowPlaying.title
            } else {
                self.currentSongTitle = nil
            }
        }
        
        if let nowPlaying = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem {
            currentSongTitle = nowPlaying.title
        } else {
            currentSongTitle = nil
        }
    }
}
