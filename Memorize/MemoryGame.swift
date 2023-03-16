import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    var cards: [Cards]
    
    var score = 0
    
    init(numberOfPairOfCards: Int, createGame: (Int) -> CardContent) {
        cards = [Cards]()
        
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
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
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                //bugus - tem que consertar
                score -= 1
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
    }
    
}
