import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        
        get { cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)} }
    }
   
    
    var cards: [Cards]
    
    var score = 0
    
    init(numberOfPairOfCards: Int, createGame: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairOfCards {
            let content: CardContent = createGame(pairIndex)
            cards.append(Cards(content: content, id: pairIndex * 2))
            cards.append(Cards(content: content, id: pairIndex * 2 + 1))
        }
        
    }
    
    var getCard: [Cards] {
        cards
    }
    
    
    
    struct Cards: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
    //MARK: - Intent
    
    
    mutating func choose(card: Cards) {
        
        print(score)
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatch = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatch].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                    
                }
                //bugus - tem que consertar
                score += 2
                cards[chosenIndex].isFaceUp = true
            } else {
               
                //bugus - tem que consertar
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                score -= 1
               
            }
            
        }
        
    }
    
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
