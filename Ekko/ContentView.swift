//
//  ContentView.swift
//  Ekko
//
//  Created by Lucas Goldner on 08.04.23.
//

import MediaPlayer
import SwiftUI

struct ContentView: View {
    @StateObject var musicController = MusicController()
    
    var body: some View {
        VStack {
            if let artwork = musicController.currentSongArtwork {
                Image(uiImage: artwork)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 7)
            } else {
                Image(systemName: "music.note")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            Text(musicController.currentSongTitle ?? "No Song Playing")
            Button(action: {}) {
                Image(systemName: "backward.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .padding()
        }.onAppear {
            musicController.checkForCurrentSong()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
