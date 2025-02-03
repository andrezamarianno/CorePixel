

import SwiftUI

struct MeusDesenhosComponente: View {
    var body: some View {
       
        ZStack{
           
                Rectangle()
                    .frame(width: 580, height: 330)
                    .cornerRadius(10)
                    .foregroundColor(Color("fundoComp"))
            VStack{
                Spacer()
                Rectangle()
                    .frame(width: 580, height: 80)
                    .cornerRadius(5)
                    .foregroundColor(Color("AzulCatalogo"))
            }
            .padding(.bottom, 230)
            VStack{
                Spacer()
                HStack{
                    Text("Meus desenhos")
                        .font(.custom("Quantico-Regular", size: 30))
                        .foregroundStyle(Color("BW"))
                    Spacer()
                        .frame(width: 300)
                }
            }.padding(250)

            }
    }
}

#Preview {
    MeusDesenhosComponente()
}
