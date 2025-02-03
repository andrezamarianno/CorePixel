//
//  MeusFavoritosComponente.swift
//  CorePixel
//
//  Created by ANDREZA MARIANNO UCHOA on 03/02/25.
//

import SwiftUI

struct MeusFavoritosComponente: View {
    var body: some View {
        
        ZStack{
          
            
            Rectangle()
                .frame(width: 420, height: 250)
                .cornerRadius(10)
                .foregroundColor(Color("AzulCatalogo"))
       
                Spacer()
            Image("coracao")
                .resizable()
                .frame(width: 160, height: 130)
                .padding(.bottom,40)
     
            VStack{
                Spacer()
                HStack{
                    Text("Meus favoritos")
                        .font(.custom("Quantico-Regular", size: 30))
                        .foregroundStyle(Color("BW"))
                        .frame(width: 300)
                }
            }.padding(290)
            
        }
    }
}

#Preview {
    MeusFavoritosComponente()
}
