import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Cards
    
    var theme: EmojiTheme
    
    @Published var model: MemoryGame<String>
    
    init(theme: EmojiTheme? = nil){
        
        self.theme = theme ?? EmojiTheme.theme.randomElement()!

        let emoji = self.theme.emojis.shuffled()
        
        model = MemoryGame(numberOfPairOfCards: self.theme.numberOfPairs) {emoji[$0]}
        model.cards = model.cards.shuffled()
        
        
    }
    
    var cards: [Card] {
        model.getCard
        //model.cards
    }
    
    var score: Int {
        model.score
    }
    
    
    func changeTheme(){
        let theme: EmojiTheme? = nil
        self.theme = theme ?? EmojiTheme.theme.randomElement()!
        let emoji = self.theme.emojis.shuffled()
        
        model = MemoryGame(numberOfPairOfCards: self.theme.numberOfPairs) {emoji[$0]}
        model.cards = model.cards.shuffled()
    }
    
    //MARK: - Intent
    
    func choose(_ card: Card){
        model.choose(card: card)
        
    }
}

