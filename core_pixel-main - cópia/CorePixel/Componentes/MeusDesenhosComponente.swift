// Ana Jamas, Andreza Marianno, Guilherme Fabbri, Heitor Ivaza

import SwiftUI

struct MeusDesenhosComponente: View {
    @ObservedObject var viewModel: CorePixelViewModel
    @State private var navigateToListaDeDesenhos = false
    
    let columns = [
        GridItem(.fixed(60), spacing: 30),
        GridItem(.fixed(60), spacing: 30),
        GridItem(.fixed(60), spacing: 30),
        GridItem(.fixed(60), spacing: 30),
        GridItem(.fixed(60), spacing: 30)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .frame(width: 580, height: 330)
                    .cornerRadius(10)
                    .foregroundColor(Color("fundoComp"))
                    .onTapGesture {
                    navigateToListaDeDesenhos = true
                     }
                
                VStack {
                    HStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0..<15) { index in
                                if index < viewModel.desenhos.count {
                                    let desenho = viewModel.desenhos[viewModel.desenhos.count - 1 - index]
                                    VStack {
                                        MiniPixelPreview(pixels: viewModel.carregarPixels(from: desenho))
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(5)
                                            .onTapGesture {
                                                navigateToListaDeDesenhos = true
                                            }
                                    }
                                } else {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(5)
                                        .opacity(0.5)
                                        .onTapGesture {
                                            navigateToListaDeDesenhos = true
                                        }
                                }
                            }
                        }
                        .frame(width: 400)
                        .padding(.leading, 150)
                        .padding(.top, 50)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 580, height: 80)
                        .cornerRadius(5)
                        .foregroundColor(Color("AzulCatalogo"))
                        .overlay(
                            HStack {
                                Text("Meus desenhos")
                                    .font(.custom("Quantico-Regular", size: 30))
                                    .foregroundStyle(Color("BW"))
                                    .padding(.leading)
                                Spacer()
                            }
                        )
                        .onTapGesture {
                        navigateToListaDeDesenhos = true
                        }
                }
            }
            .navigationDestination(isPresented: $navigateToListaDeDesenhos) {
                ListaDeDesenhos(viewModel: viewModel)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
                   viewModel.carregarDesenho()
               }
    }
}

#Preview {
    MeusDesenhosComponente(viewModel: CorePixelViewModel())
}
