import SwiftUI
import CoreData

class CorePixelViewModel: ObservableObject {
    @Published var desenhos: [Desenhos] = []
    private let context = PersistenceController.shared.container.viewContext
    
    func salvarDesenho(titulo: String, pixels: [[Color]]) {
        let desenhando = Desenhos(context: context)
        desenhando.titulo = titulo
        desenhando.criacao = Date()
        
  
        var pixelData: [Pixel] = []
        for (i, linha) in pixels.enumerated() {
            for (j, color) in linha.enumerated() {
                let pixel = Pixel(linha: i,
                                coluna: j,
                                coresRGB: color.toComponents())
                pixelData.append(pixel)
            }
        }
        
        if let encodedPixels = try? JSONEncoder().encode(pixelData) {
            desenhando.pixels = encodedPixels
        }
        
        try? context.save()
        carregarDesenho()
    }
    
    func carregarDesenho() {
        let request = NSFetchRequest<Desenhos>(entityName: "Desenhos")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Desenhos.criacao, ascending: false)]
        
        desenhos = (try? context.fetch(request)) ?? []
    }
    
    func carregarPixels(from desenhando: Desenhos) -> [[Color]] {
        var grid = Array(repeating: Array(repeating: Color.white, count: 16), count: 16)
        
        if let pixelsData = desenhando.pixels,
           let pixelArray = try? JSONDecoder().decode([Pixel].self, from: pixelsData) {
            for pixel in pixelArray {
                grid[pixel.linha][pixel.coluna] = Color.fromComponents(pixel.coresRGB)
            }
        }
        
        return grid
    }
    
    func excluirDesenho(_ desenhando: Desenhos) {
        context.delete(desenhando)
        try? context.save()
        carregarDesenho()
    }
}
