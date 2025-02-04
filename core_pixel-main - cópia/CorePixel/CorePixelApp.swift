//
//  CorePixelApp.swift
//  CorePixel
//
//  Created by HEITOR IVAZA LOPES on 29/01/25.
//
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
