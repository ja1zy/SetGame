//
//  model.swift
//  SetGame
//
//  Created by Jasdeep saran on 2022-04-28.
//

import Foundation
import SwiftUI



struct model{
    
    
    static let colors = [Color.red, Color.green, Color.blue]
    static let numbers = [1,2,3]
    static let shading = ["none", "semi", "full"]
    static let shapes = ["diamond","squiggle", "oval" ]
    
    
    
    
    var cards: [Card] = []
    //var currentHand: [Card] = []
    
    
    
    var deckOfCards: [Card] = []
    
    
    private var selectedCardsIndex: [Int] = []
    var currentHandInt: Int = 0
    
    
    
    init(totalCardsInHand: Int){
        deckOfCards = appendCards(colors: model.colors, numbers: model.numbers, shading: model.shading, shapes: model.shapes)
        deckOfCards.shuffle()
       currentHandInt = totalCardsInHand
        for index in 0 ..< currentHandInt{
            cards.append(deckOfCards[index])
        }
    }
    mutating func addCards(){
        if currentHandInt >= 81 {
                return
        }
        let three = 3
        for index in currentHandInt ..< currentHandInt+three{
            cards.append(deckOfCards[index])
        }
        currentHandInt = currentHandInt+3
        print(currentHandInt)
    }
    
    func cardIndex(card: Card) -> Int? {
        cards.firstIndex(where: {$0.id == card.id})
    }
    
    mutating func choose(card: Card){
        
        //if let chosenIndex = cards.firstIndex(where: {$0.id == card.id})
        if let cardIndex = cards.firstIndex(where: { $0.id == card.id })
            , selectedCardsIndex.count == 2 {
            
            if selectedCardsIndex.contains(cardIndex) {
                return
            }
            
            
            
            selectedCardsIndex.append(cardIndex)
            
            cards[cardIndex].selected = true
            let val1 = selectedCardsIndex[0]
            let val2 = selectedCardsIndex[1]
            let val3 = selectedCardsIndex[2]
            
            
            //print("\(selectedCardsIndex)")
            
            //print("first    \(cards[val1])")
            //print("second \(cards[val2])")
            //print("third \(cards[val3])")
            
            let condition1 =
                (cards[val1].color == cards[val2].color) == (cards[val2].color == cards[val3].color)
            
            let condition2 =
                (cards[val1].number == cards[val2].number) == (cards[val2].number == cards[val3].number)

            let condition3 =
                (cards[val1].shading == cards[val2].shading) == (cards[val2].shading == cards[val3].shading)
            
            let condition4 =
                (cards[val1].shape == cards[val2].shape) == (cards[val2].shape == cards[val3].shape)

                //check if all 4 statements are true or not!!!
            let verifyAll = (condition1 && condition2) && (condition3 && condition4)
            
            
            
            cards[val1].selected = false
            cards[val2].selected = false
            cards[val3].selected = false
            
            if verifyAll {
                //cards[val1].setMade = true
                //cards[val2].setMade = true
                //cards[val3].setMade = true
                
                print("\(val1) \(val2) \(val3)")
                cards.remove(at: val1)
                cards.remove(at: val2)
                cards.remove(at: val3)
                print("set made!!!!!!")
            }
            
            
            
            
            

            //make if statement with all four, and then let the
            //cards'original position be left alone, or remove the cards if there's a mathc
            // and then do the rest, which is the case id
            selectedCardsIndex = []
        } else{
            if let cardIndex = cards.firstIndex(where: { $0.id == card.id }){
                
                if selectedCardsIndex.contains(cardIndex) {
                    return
                }
                cards[cardIndex].selected = true
                
                //print("\(cards[cardIndex])")
                
                selectedCardsIndex.append(cardIndex)
                
            }
        }
    }
    

    
    
    
    /*
     just makes a deck of cards.
     does nothing else. only applicable to the whole thing!!!!!
     */
    
    private func appendCards(colors: [Color],numbers: [Int],shading: [String],shapes: [String]) -> [Card] {
        var returnThis: [Card] = []
        var numb = 0
        
        //make 4 for loops!!!!!
        for color in colors{
            for number in numbers{
                for shade in shading{
                    for shape in shapes{
                        returnThis.append(Card(color: color, number: number, shading: shade, shape: shape, id: numb))
                        numb = numb+1
                    }
                }
                
            }
        }
        //four for loops ends here!!!
        return returnThis
    }
    //the struct that tell us everythging!!!!!!!

}






struct Card: Identifiable{
    var color: Color
    var number: Int
    var shading: String
    var selected: Bool = false
    var shape: String  //change this later!!!!!!!!
    var id: Int
    var setMade: Bool = false
}





