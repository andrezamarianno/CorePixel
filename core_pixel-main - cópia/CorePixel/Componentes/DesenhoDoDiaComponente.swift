
import SwiftUI

struct DesenhoDoDiaComponente: View {
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width: 380, height: 250)
                .cornerRadius(10)
                .foregroundColor(Color("fundoComp"))
            VStack{
                Spacer()
                Rectangle()
                    .frame(width: 380, height: 80)
                    .cornerRadius(5)
                    .foregroundColor(Color("AzulCatalogo"))
            }
            .padding(.bottom, 230)
            VStack{
                Spacer()
                HStack{
                    Text("Desenho do dia!")
                        .font(.custom("Quantico-Regular", size: 30))
                        .foregroundStyle(Color("BW"))
                        .frame(width: 300)
                }
            }.padding(250)
            
        }
    }
}
#Preview {
    DesenhoDoDiaComponente()
}
