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
            
            let shape = RoundedRectangle(cornerRadius: 20)
            ZStack {
                if card.isFaceUp {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 5)
                        //.foregroundColor(.red)
                    Text(card.content).font(.largeTitle)
                }
                
                else if card.isMatched == true{
                    shape.opacity(0.0)
                }
                
                else {
                    shape.foregroundColor(.red)
                }
            }
            
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game)
        }
    }
    
    
}
