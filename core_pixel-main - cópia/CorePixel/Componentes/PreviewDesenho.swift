import SwiftUI

struct PreviewDesenho: View {
    @State private var estaFavorito: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 330, height: 180)
                .cornerRadius(10)
                .foregroundColor(Color("fundoComp"))
            
            VStack {
                Spacer()
                Rectangle()
                    .frame(width: 330, height: 80)
                    .cornerRadius(4)
                    .foregroundColor(Color("AzulCatalogo"))
            }
            .padding(.bottom, 230)
            
            VStack {
                Spacer()
                HStack {
                    Text("Pizza")
                        .font(.custom("Quantico-Regular", size: 25))
                        .foregroundStyle(Color("BW"))
                       .padding(.horizontal, 175)
                        .padding(.leading,30)
              
                    Rectangle()
                        .frame(width: 60, height: 50)
                        .cornerRadius(5)
                        .foregroundColor(Color("fundoFavorito"))
                        .overlay(
                            Image(estaFavorito ? "naoFavorito" : "simFavorito")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 30)
                                .foregroundColor(.red)
                        )
                        .onTapGesture {
                            estaFavorito.toggle()
                        }
                    
                    Spacer()
                }
            }
            .padding(244)
        }
    }
}

#Preview {
    PreviewDesenho()
}
