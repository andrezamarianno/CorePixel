import SwiftUI

struct ContentView: View {
    @State var curColor: Color = .black
    @State var reset: Bool = false
    @State var gridColors: [[Color]] = Array(repeating: Array(repeating: .white, count: 16), count: 16)
    @State var painting: Bool = false
    @State var locked: Bool = false
    
    let squareSize: CGFloat = 23
    
    @State private var tituloDesenho = ""
    @State private var mostrarAlertaSalvar = false
    
    @ObservedObject var viewModel = CorePixelViewModel()
        @Environment(\.dismiss) private var dismiss
    init(viewModel: CorePixelViewModel, initialGrid: [[Color]]) {
            self.viewModel = viewModel
            _gridColors = State(initialValue: initialGrid)
        }
    
    var body: some View {
        VStack {
            HStack {
               /* Button(action:{
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                    
                }*/
                Spacer()
                
                botaoSalvar(action: {
                                mostrarAlertaSalvar = true
                            })
            }
            .padding(90)
            
            GeometryReader { geometry in
                VStack {
                    ForEach(0..<16, id: \.self) { i in
                        HStack {
                            ForEach(0..<16, id: \.self) { j in
                                SquareComponent(  corParaPintar: $curColor,
                                                reset: $reset,
                                                posicao: (linha: i, coluna: j),
                                                pixelGrid: $gridColors    )
                                    .frame(width: squareSize, height: squareSize)
                                    .border(Color.gray, width: 0.3)
                                    .padding(-3.95)
                            }
                        }
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            painting = true
                            let location = value.location
                            let column = Int(location.x / squareSize)
                            let row = Int(location.y / squareSize)
                            
                            if row >= 0, row < 16, column >= 0, column < 16 {
                                if locked == true {
                                    if gridColors[row][column] == Color.white {
                                        gridColors[row][column] = curColor
                                    }
                                } else {
                                    gridColors[row][column] = curColor
                                }
                            }
                        }
                        .onEnded { _ in
                            painting = false
                        }
                )
            }
            .frame(width: squareSize * 16, height: squareSize * 16)
            
            HStack {
                Button("", systemImage: locked == false ? "lock.open" : "lock") {
                    locked.toggle()
                }
                
                Spacer()
                    .frame(width: 320)
                
                Button("", systemImage: "trash") {
                    reset.toggle()
                    gridColors = Array(repeating: Array(repeating: .white, count: 16), count: 16)
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 75)
                    .foregroundColor(.gray.opacity(0.2))
                    .cornerRadius(6)
                HStack {
                    PalleteSquare(color: .black, curColor: $curColor)
                    PalleteSquare(color: .red, curColor: $curColor)
                    PalleteSquare(color: .blue, curColor: $curColor)
                    PalleteSquare(color: .green, curColor: $curColor)
                    PalleteSquare(color: .white, curColor: $curColor)
                }
            }
        }
        .alert("Salvar Desenho", isPresented: $mostrarAlertaSalvar) {
            TextField("Título do desenho", text: $tituloDesenho)
            Button("Cancelar", role: .cancel) {}
            Button("Salvar") {
                viewModel.salvarDesenho(titulo: tituloDesenho, pixels: gridColors)
                tituloDesenho = ""
                dismiss()
            }
        }
    }
}

#Preview {
    ContentView(viewModel: CorePixelViewModel(),
                initialGrid: Array(repeating: Array(repeating: .white, count: 16), count: 16))
}
