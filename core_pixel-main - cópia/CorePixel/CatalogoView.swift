
import SwiftUI

struct CatalogoView: View {
    
    @StateObject var viewModel: CorePixelViewModel
    
    @State private var selectedGrid: [[Color]] = Array(repeating: Array(repeating: .white, count: 16), count: 16)
    
    let catalogoViewModel : CatalogoViewModel = CatalogoViewModel()
    
    let titulos = ["Coração", "Pizza", "Tomate"]
    
    let columns = [
        GridItem(.flexible(), spacing: 20)
        
    ]
    
    var body: some View {
        
        
            
            NavigationStack {
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color("background"))
                        .zIndex(1.5)
                        .ignoresSafeArea()
                
                VStack{
                    Image("CorePixel")
                        .resizable()
                        .frame(width: 500, height: 100)
                        .padding(50)
                    
                    
                    HStack{
                        
                        
                        Text("Catálogo")
                            .font(.custom("Quantico-Regular", size: 40))
                            .padding(70)
                            .padding(.top, -100)
                            .offset(x: 30)
                        
                        Spacer()
                        
                        
                    }
  
                        HStack{
                            LazyHGrid(rows: columns, spacing: 80) {
                                
                                ForEach(0..<3, id: \.self) { index in
                                    NavigationLink(destination: DesenhoView(viewModel: viewModel, initialGrid: selectedGrid, initialDrawing: catalogoViewModel.listaDesenhos[index], premade: true, _premadeID: index, _estaSalvo: false, _desenhoSalvoID: 0)) {
                                        VStack {
                                            MiniPixelPreview(pixels: catalogoViewModel.converterParaPixels(catalogoViewModel.listaDesenhos[index]))
                                                .frame(height: 250)
                                                .frame(width: 250)
                                                .cornerRadius(10)
                                            
                                            ZStack{

                                                  Rectangle()
                                                .frame(width: 250, height: 50)
                                                .cornerRadius(5)
                                                .foregroundColor(Color("AzulCatalogo"))
                                                .padding(.top, -20)
                                                
                                                HStack {
                                                Text(titulos[index])
                                                .font(.custom("Quantico-Regular", size: 20))
                                                .foregroundColor(.black)
                                                .padding(.leading, 20)
                                                Spacer()
                                              }
                                                .padding(.top, -20)
                                            }
                                        }
                                    }
                                }
                            } .offset(x: 90, y: -40)
                            Spacer()
                             
                        }
                    
                   
                    HStack {
                        MeusDesenhosComponente(viewModel: viewModel)
                            .padding(.trailing,15)

                        Spacer()

                     
                            NavigationLink(destination: DesenhoView(viewModel: viewModel, initialGrid: selectedGrid, initialDrawing: catalogoViewModel.listaDesenhos[3], premade: false, _premadeID: 3, _estaSalvo: false, _desenhoSalvoID: 0)) {
                                MaoLivreComponente()
                                    .frame(width: 580, height: 330)
                                    .padding(.trailing, 10)
                                    .offset(x: -35, y: 10)
                            }
                            
                        
                        .padding()
                    }
                    .padding()
                    
                    Spacer()
                }
                
                .zIndex(10)
                
            }
                .onAppear {
                              viewModel.carregarDesenho()
                          }
        }
    }
}

#Preview {
    CatalogoView(viewModel: CorePixelViewModel())
}
