//
//  SetGameApp.swift
//  SetGame
//
//  Created by Jasdeep saran on 2022-04-28.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        //note: content view's observeOBJECT ISN'T SET. WE SET IT HERE.
        //IN THE APP PAGE
        let game = viewModel()
        WindowGroup {
            ContentView(setGame: game)
        }
    }
}
