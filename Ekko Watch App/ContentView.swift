//
//  ContentView.swift
//  Ekko Watch App
//
//  Created by Lucas Goldner on 08.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "hourglass")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Work in progress")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
