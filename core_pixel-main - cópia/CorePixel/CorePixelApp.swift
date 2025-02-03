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
    
    var body: some Scene {
        WindowGroup {
            CatalogoView(viewModel: CorePixelViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
