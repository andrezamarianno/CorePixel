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

    var catalogoViewModel : CatalogoViewModel = CatalogoViewModel()

    
    @State var isPremade : Bool = false
    @State var premadeID : Int64 = 0
    
    @State var desenhoSalvoID : Int = 0
 
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundStyle(Color("background"))
                .zIndex(1.5)
                .ignoresSafeArea()
            
            
            
            VStack {
                HStack{
                    Text("Meus desenhos")
                        .bold()
                        .font(.custom("Quantico-Regular", size: 30))
                        .padding(50)
                    Spacer()
                    
                }
                Spacer()
            }
            .zIndex(5.0)
            
            
            
            
            
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
                                    VStack{
                                        HStack{
                                            Text(desenhando.titulo ?? "Sem título")
                                                .font(.custom("Quantico-Regular", size: 25))
                                                .padding(.horizontal, 20)
                    
                                            
                                            Text(desenhando.criacao ?? Date(), formatter: dateFormatter)
                                                .font(.custom("Quantico-Regular", size: 25))
                                                .foregroundColor(.secondary)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                         .padding(.trailing, 20)
                                            
                                        }
                                    }
                                    .padding(.top, -32)
                                    Spacer()
                                    
                                }
                                .padding(.horizontal, 20)
                            }
                            .onTapGesture {
                                selectedGrid = viewModel.carregarPixels(from: desenhando)
                                vaiParaContent = true
                                premadeID = desenhando.premadeID
                                if(premadeID == 0 || premadeID == 1 || premadeID == 2){
                                    isPremade = true
                                } else {
                                    isPremade = false
                                }
                                
                                for i in 0..<viewModel.desenhos.count{
                                    if(desenhando == viewModel.desenhos[i]){
                                        desenhoSalvoID = i
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    
                }
                
                
            }
            .navigationTitle("Meus desenhos")
            .navigationDestination(isPresented: $vaiParaContent) {
                if let grid = selectedGrid {
                    DesenhoView(viewModel: viewModel, initialGrid: grid, initialDrawing: catalogoViewModel.listaDesenhos[Int(premadeID)], premade: isPremade, _premadeID: 3, _estaSalvo: true, _desenhoSalvoID: desenhoSalvoID)
                }
            }
            .onAppear {
                viewModel.carregarDesenho()
                
            }
            
            .zIndex(10)
        }
        
    }
}

