import SwiftUI
import CoreData

struct ListaDeDesenhos: View {
    @ObservedObject var viewModel: CorePixelViewModel
    @State private var vaiParaContent = false
    @State private var selectedGrid: [[Color]]?
    var catalogoViewModel : CatalogoViewModel = CatalogoViewModel()

    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Button(action: {
                    selectedGrid = Array(repeating: Array(repeating: .white, count: 16), count: 16)

                    vaiParaContent = true
                }) {
                    HStack {
                        Text("pintando a mão livre")
                            .font(.title2)
                    }
                    .padding()
                    .background(Color("AzulCatalogo"))
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                }
                
                Spacer()
                    .frame(height: 40)
                
                List {
                    ForEach(viewModel.desenhos) { desenhando in
                        VStack(alignment: .leading) {
                            Text(desenhando.titulo ?? "Sem título")
                                .font(.headline)
                            Text(desenhando.criacao ?? Date(), style: .date)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .onTapGesture {
                                               selectedGrid = viewModel.carregarPixels(from: desenhando)
                                               vaiParaContent = true
                                           }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewModel.excluirDesenho(viewModel.desenhos[index])
                        }
                    }
                }
            }
            .navigationTitle("Meus desenhos")
            .navigationDestination(isPresented: $vaiParaContent) {
                if let grid = selectedGrid {
                    ContentView(viewModel: viewModel, initialGrid: grid, initialDrawing: catalogoViewModel.listaDesenhos[3], premade: false)
                           }
            }
            .onAppear {
                viewModel.carregarDesenho()
            }
        }
    }
}


