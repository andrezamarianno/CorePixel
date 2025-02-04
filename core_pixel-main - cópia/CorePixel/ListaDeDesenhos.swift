import SwiftUI
import CoreData

struct ListaDeDesenhos: View {
    @ObservedObject var viewModel: CorePixelViewModel
    @State private var vaiParaContent = false
    @State private var selectedGrid: [[Color]]?
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    private var dateFormatter: DateFormatter {
          let formatter = DateFormatter()
          formatter.dateFormat = "dd/MM/yy"
          return formatter
      }
    
    var body: some View {
       
            
            HStack{
                Text("Meus desenhos")
                    .bold()
                    .font(.custom("Quantico-Regular", size: 30))
                    .padding(50)
                Spacer()
                
            }
            .background(Color("background"))
            
            NavigationStack {
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 70) {
                        ForEach(viewModel.desenhos) { desenhando in
                            VStack {
                                MiniPixelPreview(pixels: viewModel.carregarPixels(from: desenhando))
                                    .frame(height: 400)
                                    .frame(width: 400)
                                    .cornerRadius(10)
                                
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .frame(width: 400, height: 80)
                                        .cornerRadius(5)
                                        .foregroundColor(Color("AzulCatalogo"))
                                        .padding(.top, -35)
                                    HStack{
                                        Text(desenhando.titulo ?? "Sem título")
                                            .font(.custom("Quantico-Regular", size: 25))
                                        
                                        Text(desenhando.criacao ?? Date(), formatter: dateFormatter)
                                            .font(.custom("Quantico-Regular", size: 25))
                                            .foregroundColor(.secondary)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                    }
                                    
                                    Spacer()
                                    
                              }
                                .padding(.horizontal, 20)
                            }
                            .onTapGesture {
                                selectedGrid = viewModel.carregarPixels(from: desenhando)
                                vaiParaContent = true
                            }
                        }
                    }
                    .padding()
                }
                .background(Color("background"))
                .navigationDestination(isPresented: $vaiParaContent) {
                    if let grid = selectedGrid {
                        let numberGrid = grid.map { row in
                            row.map { color in
                                viewModel.getColorID(_color: color)
                            }
                        }
                        
                        ContentView(
                            viewModel: viewModel,
                            initialGrid: grid,
                            initialDrawing: numberGrid,
                            premade: false
                        )
                    }
                }
                .onAppear {
                    viewModel.carregarDesenho()
                }
                
            }
            
        }
       
    }
    


#Preview {
    ListaDeDesenhos(viewModel: CorePixelViewModel())
}
