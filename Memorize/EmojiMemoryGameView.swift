import SwiftUI



struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            HStack{
                Text(game.theme.name)
                Spacer()
                Text(String(game.score))
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                ForEach(game.cards){
                    cards in CardView(card: cards)
                        .aspectRatio(2/3, contentMode: .fill)
                        .onTapGesture {
                            game.choose(cards)
                            
                        }
                        .foregroundColor(game.theme.color)
                    
                }
                
            }
        }
        .padding(.horizontal)
        HStack(alignment: .center) {
            Image(systemName: "goforward")
            Text("NewGame")
                
        }.font(.title)
            .onTapGesture {
                game.changeTheme()
            }
        
    }
    
    
    struct CardView: View {
        
        var card: EmojiMemoryGame.Card
        var viewModel = EmojiMemoryGame()
        
        
        var body: some View {
            
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            
            GeometryReader { geometry in
                ZStack {
                    if card.isFaceUp {
                        shape.foregroundColor(.white)
                        shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        Text(card.content).font(font(in: geometry.size))
                    }
                    
                    else if card.isMatched == true{
                        shape.opacity(0)
                    }
                    
                    else {
                        shape.fill()
                    }
                }
            }
        }
        
        private func font(in size: CGSize) -> Font {
            Font.system(size: min(size.width, size.height * DrawingConstants.fontScale))
        }
        
        private struct DrawingConstants {
            static let cornerRadius: CGFloat = 20
            static let lineWidth: CGFloat = 5
            static let fontScale: CGFloat = 0.5
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game)
        }
    }
    
    
}
