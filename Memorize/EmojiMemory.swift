import Foundation
import SwiftUI

class EmojiMemory: ObservableObject {
    
    
    var theme: EmojiTheme
    
    @Published var model: MemoryGame<String>
    
    init(theme: EmojiTheme? = nil){
        
        self.theme = theme ?? EmojiTheme.theme.randomElement()!

        let emoji = self.theme.emojis.shuffled()
        
        model = MemoryGame(numberOfPairOfCards: self.theme.numberOfPairs) {emoji[$0]}
        model.cards = model.cards.shuffled()
        
        
    }
    
    var cards: [MemoryGame<String>.Cards] {
        model.cards
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
    
    func choose(_ card: MemoryGame<String>.Cards){
        model.choose(card: card)
        
    }
}
