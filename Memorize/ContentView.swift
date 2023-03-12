import SwiftUI



struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemory
    
    var body: some View {
        ScrollView {
            HStack{
                Text(viewModel.theme.name)
                Spacer()
                Text(String(viewModel.score))
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                ForEach(viewModel.cards){
                    cards in CardView(card: cards)
                        .aspectRatio(2/3, contentMode: .fill)
                        .onTapGesture {
                            viewModel.choose(cards)
                            
                        }
                        .foregroundColor(viewModel.theme.color)
                    
                }
                
            }
        }
        .padding(.horizontal)
        HStack {
            Image(systemName: "goforward")
            Text("NewGame")
                
        }.font(.title)
            .onTapGesture {
                viewModel.changeTheme()
            }
        
    }
    
    
    struct CardView: View {
        
        var card: MemoryGame<String>.Cards
        var viewModel = EmojiMemory()
        
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
            let game = EmojiMemory()
            ContentView(viewModel: game)
        }
    }
    
    
}
