//
//  viewModel.swift
//  SetGame
//
//  Created by Jasdeep saran on 2022-05-04.
//

import SwiftUI


// the actual game

class viewModel: ObservableObject {
    
    static let startCards = 18
    @Published var setGame: model = createSetGame()
    var numberOfCards: Int = startCards
    
    private static func createSetGame() -> model {
        return model(totalCardsInHand: startCards)
    }
    func addCards(){
        setGame.addCards()
    }
    
    func chooseCard(chosenCard: Card){
        print("choose activated")
        setGame.choose(card: chosenCard)
       
    }
    
    
    
    
}






