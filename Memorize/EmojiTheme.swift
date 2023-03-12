import Foundation
import SwiftUI


struct EmojiTheme {
    var name: String
    var emojis: [String]
    var numberOfPairs: Int
    var color: Color
    
    init(name: String, emojis: [String], numberOfPairs: Int, color: Color) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairs = numberOfPairs
        self.color = color
    }
    
    static let theme: [EmojiTheme] = [
        EmojiTheme(name: "Emojis", emojis: ["😀", "😜", "😉", "🥰" , "🥳", "🤓", "🙁"], numberOfPairs: 6, color: .blue),
        EmojiTheme(name: "Vehicles", emojis: ["🚗", "🚛", "🚜", "🚑", "✈️", "🛶", "🚁"], numberOfPairs: 7, color: .purple),
        EmojiTheme(name: "Animals", emojis: ["🐹","🐂","🐃","🐄","🐮","🐅","🐆","🐱"], numberOfPairs: 8, color: .red),
        EmojiTheme(name: "Balls", emojis: ["⚽️","🏀", "🏈", "⚾️", "🥎","🎱"], numberOfPairs: 5, color: .green)
    ]
}
