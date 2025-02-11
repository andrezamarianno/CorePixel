// Ana Jamas, Andreza Marianno, Guilherme Fabbri, Heitor Ivaza
// CorePixelApp //

import SwiftUI

@main
struct YourAppName: App {
    let persistenceController = PersistenceController.shared
    let viewModel : CorePixelViewModel = CorePixelViewModel()
    
    var body: some Scene {
        WindowGroup {
            CatalogoView(viewModel: viewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
