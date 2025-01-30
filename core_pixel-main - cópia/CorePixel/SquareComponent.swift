import SwiftUI

struct SquareComponent: View {
    @Binding var corParaPintar: Color
    @Binding var reset: Bool
    let posicao: (linha: Int, coluna: Int)
    @Binding var pixelGrid: [[Color]]
    
    var body: some View {
        Rectangle()
            .frame(width: 23, height: 23)
            .border(Color.gray, width: 0.4)
            .padding(-3.95)
            .onTapGesture {
                pixelGrid[posicao.linha][posicao.coluna] = corParaPintar
            }
            .foregroundColor(pixelGrid[posicao.linha][posicao.coluna])
            .onChange(of: reset) {
                resetarCor()
            }
    }
    
    func resetarCor() {
        pixelGrid[posicao.linha][posicao.coluna] = .white
    }
}
