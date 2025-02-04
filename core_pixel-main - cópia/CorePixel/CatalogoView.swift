
import SwiftUI

struct CatalogoView: View {
    
    @ObservedObject var viewModel: CorePixelViewModel
    
    @State private var selectedGrid: [[Color]] = Array(repeating: Array(repeating: .white, count: 16), count: 16)
    
    let catalogoViewModel : CatalogoViewModel = CatalogoViewModel()
    
    let titulos = ["Coração", "Pizza", "Donut", "Melancia", "Sol", "Deadpool"]
    
    var body: some View {
        
        
        NavigationStack {
            
            VStack{
                Image("CorePixel")
                    .resizable()
                    .frame(width: 400, height: 80)
                    .padding(20)
                
                HStack{
                    
                    
                    Text("Catálogo")
                        .font(.custom("Quantico-Regular", size: 40))
                        .padding(70)
                    
                    Spacer()
                    
                }
                
                VStack {
                    NavigationLink(destination: ContentView(viewModel: viewModel, initialGrid: selectedGrid, initialDrawing: catalogoViewModel.listaDesenhos[0], premade: true)){
                        Text("Desenho 1")
                    }
                    NavigationLink(destination: ContentView(viewModel: viewModel, initialGrid: selectedGrid, initialDrawing: catalogoViewModel.listaDesenhos[1], premade: true)){
                        Text("Desenho 2")
                    }
                    NavigationLink(destination: ContentView(viewModel: viewModel, initialGrid: selectedGrid, initialDrawing: catalogoViewModel.listaDesenhos[2], premade: true)){
                        Text("Desenho 3")
                    }
                    NavigationLink(destination: ContentView(viewModel: viewModel, initialGrid: selectedGrid, initialDrawing: catalogoViewModel.listaDesenhos[3], premade: false)){
                        Text("Desenho livre")
                    }
                    NavigationLink(destination: ListaDeDesenhos(viewModel: viewModel)){
                                           Text("Meus Desenhos")
                                       }
                }

                
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    CatalogoView(viewModel: CorePixelViewModel())
}



