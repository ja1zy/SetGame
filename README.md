# SetGame

##Descrption 
  #Set is a game where players start with a 3X3 grind of nine. if a match can be made, then the cards are removed from the game.
   However, if no match can be made, then user can add 3 cards to the game by pressing "add cards" button. 
   
## shapes
  The game has 3 specfic shapes, which are Diamond, oval, and squiggle. these cards come in three colors, green, blue and red. 
  These colors  come in 3 different opacities, clear, transluscent, and fully filled. Also, each card has between 1 to 3 total shapes inside of it. 
  
##MVVM (design pattern)
  the model holds the logic of the program, where cards are elinated based on if a match has occured or not. The view-model is simply a class, 
  which is really just an instance of the model. it ensures that the program has the necessary cards that are needed, and it also connects the 
  view to the model. the view-model is a connector of the two programs. The view is simply the UI that the user will see. It simple tells the 
  view-model what changes had been made to the current card game, and it also designs how big the cards appear to the user. 
