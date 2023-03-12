import SwiftUI

@main
struct TestsApp: App {
    var body: some Scene {
        
        let game = EmojiMemory()
        
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
