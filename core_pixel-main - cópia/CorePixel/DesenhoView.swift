import SwiftUI

struct DesenhoView: View {
    
    @State var curColor: Color = .black
    @State var reset: Bool = false
    
    @State var gridColors: [[Color]] = Array(repeating: Array(repeating: .white, count: 16), count: 16)

    @State var gridNumbers: [[Int]]

    
    var colorPalette : [Color] = [Color.white, Color.black, Color.red, Color.blue, Color.yellow, Color.orange, Color.green, Color.purple]
    
    @State var painting: Bool = false
    
    var premadeDrawing : Bool = true
    var premadeID : Int
    @State var locked: Bool = false
    
    @State var desenhoSalvoAlerta : Bool = false
    
    var estaSalvo : Bool
    var desenhoSalvoID : Int
    
    let squareSize: CGFloat = 23
    
    @State private var tituloDesenho = ""
    @State private var mostrarAlertaSalvar = false
    
    @ObservedObject var viewModel = CorePixelViewModel()
        @Environment(\.dismiss) private var dismiss
    init(viewModel: CorePixelViewModel, initialGrid: [[Color]], initialDrawing: [[Int]], premade : Bool, _premadeID : Int, _estaSalvo : Bool, _desenhoSalvoID : Int) {
            self.viewModel = viewModel
            _gridColors = State(initialValue: initialGrid)
            _gridNumbers = State(initialValue: initialDrawing)
            premadeDrawing = premade
            premadeID = _premadeID
            estaSalvo = _estaSalvo
            desenhoSalvoID = _desenhoSalvoID
 
        }
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                
                botaoSalvar(action: {
                    
                    if(!estaSalvo){
                        mostrarAlertaSalvar = true
                        print("Desenho novo!")
                    } else {
                        viewModel.editarDesenho(pixels: gridColors, desenho: viewModel.desenhos[desenhoSalvoID])
                        desenhoSalvoAlerta = true
                        print("Desenho existente")
                    }
      
                            })
            }
            .padding(90)
            
            GeometryReader { geometry in
                VStack {
                    ForEach(0..<16, id: \.self) { i in
                        HStack {
                            ForEach(0..<16, id: \.self) { j in
                                SquareComponent(corParaPintar: $curColor,
                                                reset: $reset,
                                                posicao: (linha: i, coluna: j),
                                                pixelGrid: $gridColors, numberGrid: $gridNumbers, viewModel: viewModel)
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
                                        if(!premadeDrawing){
                                            gridColors[row][column] = curColor
                                        } else {
                                            if(viewModel.getColorID(_color: curColor) == gridNumbers[row][column])
                                            {
                                                gridColors[row][column] = curColor
                                            }
                                        }
                                    }
                                } else {
                                    if(!premadeDrawing){
                                        gridColors[row][column] = curColor
                                    } else {
                                        if(viewModel.getColorID(_color: curColor) == gridNumbers[row][column])
                                        {
                                            gridColors[row][column] = curColor
                                        }
                                    }
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
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(0..<colorPalette.count){ i in
                            PalleteSquare(color: colorPalette[i], curColor: $curColor, viewModel: viewModel)
                                .overlay {
                                    if(viewModel.getColorID(_color: colorPalette[i]) != -1){
                                        Text("\(viewModel.getColorID(_color: colorPalette[i]))")
                                            .foregroundStyle(viewModel.getColorID(_color: colorPalette[i]) == 0 ? Color.white : Color.black)
                                    }
                                    
                                }
                            
                        }
                        
                    }
                }.frame(width: 275)
            }
        }
        .alert("Salvar Desenho", isPresented: $mostrarAlertaSalvar) {
            TextField("Título do desenho", text: $tituloDesenho)
            Button("Cancelar", role: .cancel) {}
            Button("Salvar") {
                viewModel.salvarDesenho(titulo: tituloDesenho, pixels: gridColors, premadeID: Int64(premadeID))
                tituloDesenho = ""
                dismiss()
            }
        }
        .alert("Desenho salvo", isPresented: $desenhoSalvoAlerta) {
            Button("OK", role: .cancel) {
                dismiss()
            }
            
        }
    }
}
