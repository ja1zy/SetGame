//
//  ContentView.swift
//  SetGame
//
//  Created by Jasdeep saran on 2022-04-28.
//

import SwiftUI

struct ContentView: View {
    
    
    //notice how set game isnt set. we literally create
    //a set to make it have its own object
    @ObservedObject var setGame: viewModel
    
    
    
    var body: some View {
        ScrollView{ //scroll view lets us scrol
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){ //the grid
                    ForEach(setGame.setGame.cards){
                        card in
                        cardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                setGame.chooseCard(chosenCard: card)
                            }
                    }
                }
            }
            .foregroundColor(.black)
            .padding(20)
            //button adds cards!!!
        
        Button("add Cards"){
            setGame.addCards()
        }
         
         
    }
    
}
//view of each card!!!!
struct cardView: View{
    let card: Card
    var body: some View{
        //GeometryReader { geometry in
            ZStack{
                let cardShape = RoundedRectangle(cornerRadius: 20)
                //the card itself!!!!!!
                if card.selected {
                    cardShape.foregroundColor(.yellow).opacity(0.40)
                }
                else{
                    //the lining around the cards
                    cardShape.foregroundColor(.white)
                }
            
                cardShape.strokeBorder(lineWidth: 3).foregroundColor(.red)
                
                /*
                Text(" \(card.number), \(card.shading), "+card.shape )
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundColor(card.color)
                */
                
                VStack{
                    ForEach(0 ..< card.number) { _ in
                        let currentCard = getShape(shape: card.shape)
                        
                        if card.shading=="none"{
                        currentCard.stroke(lineWidth: 3.0).foregroundColor(card.color)
                        } else if card.shading=="semi"{
                            currentCard.foregroundColor(card.color)
                                .opacity(0.22)
                        }else{
                            currentCard.foregroundColor(card.color)
                        }
                    Divider()
                    }
                }.padding(0.8)
                
                
                
            }
        }
    
}







//this struct lets ue return a Shape
struct AnyShape: Shape {
    init<S: Shape>(_ wrapped: S) {
        _path = { rect in
            let path = wrapped.path(in: rect)
            return path
        }
    }

    func path(in rect: CGRect) -> Path {
        return _path(rect)
    }

    private let _path: (CGRect) -> Path
}




//this lets us exchange a string for the shape of the card
func getShape(shape: String) ->   some Shape{
    switch shape{
    case "diamond":
        return AnyShape(Diamond())
    
    case "squiggle":
        return AnyShape(Squiggle())
    case "oval":
        return AnyShape(Oval())
        
    default:
        return AnyShape(RoundedRectangle(cornerRadius: 20.0))
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //notice how the @observedObject isn't set, and so we have to
        //make its own element!!!!!
        let game = viewModel()
        ContentView(setGame: game)
    }
}
