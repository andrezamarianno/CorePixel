import SwiftUI

struct SquareComponent: View {
    @Binding var corParaPintar: Color
    @Binding var reset: Bool
    let posicao: (linha: Int, coluna: Int)
    @Binding var pixelGrid: [[Color]]
    @Binding var numberGrid : [[Int]]
    
    var viewModel : CorePixelViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 23, height: 23)
                .border(Color.gray, width: 0.4)
                .padding(-3.95)
                .foregroundColor(pixelGrid[posicao.linha][posicao.coluna])
                .onChange(of: reset) {
                    resetarCor()
                }
            
            if(viewModel.getColorID(_color: pixelGrid[posicao.linha][posicao.coluna]) != numberGrid[posicao.linha][posicao.coluna]){
                Text(numberGrid[posicao.linha][posicao.coluna] != -1 ? String(numberGrid[posicao.linha][posicao.coluna]) : "")
                    .foregroundColor(Color.black.opacity(0.5))
            }
            
        }
    }
    
    func resetarCor() {
        pixelGrid[posicao.linha][posicao.coluna] = .white
    }
}
