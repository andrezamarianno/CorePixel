//
//  MaoLivreComponente.swift
//  CorePixel
//
//  Created by ANDREZA MARIANNO UCHOA on 03/02/25.
//

import SwiftUI

struct MaoLivreComponente: View {
    var body: some View {
        
        ZStack{
          
            
            Rectangle()
                .frame(width: 750, height: 250)
                .cornerRadius(10)
                .foregroundColor(Color("AzulCatalogo"))
       
                Spacer()
                Image("pixelsAmao")
                .resizable()
                .frame(width: 750, height: 200)
     
            VStack{
                Spacer()
                HStack{
                    Text("Pintando a mão livre!")
                        .font(.custom("Quantico-Regular", size: 30))
                        .foregroundStyle(Color("BW"))
                        .frame(width: 300)
                }
            }.padding(500)
            
        }
    }
}


#Preview {
    MaoLivreComponente()
}
