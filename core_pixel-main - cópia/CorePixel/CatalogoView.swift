
import SwiftUI

struct CatalogoView: View {
    var body: some View {
        
        let titulos = ["Coração", "Pizza", "Donut", "Melancia", "Sol", "Deadpool"]
        
            VStack{
                Image("CorePixel")
                    .resizable()
                    .frame(width: 400, height: 80)
                    .padding(20)
                    
                HStack{
                
                        
                    Text("Catálogo")
                        .font(.custom("Quantico-Regular", size: 40))
                        .padding(70)
                        
                    Spacer()
                       
                }
                
                Spacer()
            }
        
       
        
    }
}

#Preview {
    CatalogoView()
}



