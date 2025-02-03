//
//  PalleteSquare.swift
//  ko[wqkopafkopdwa
//
//  Created by HEITOR IVAZA LOPES on 29/01/25.
//

import SwiftUI

struct PalleteSquare: View {
    var color : Color
    @Binding var curColor: Color
    var viewModel : CorePixelViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: curColor == color ? 50 : 40, height: curColor == color ? 50 : 40)
                .foregroundColor(color)
                .onTapGesture {
                    curColor = color
                }
                .cornerRadius(5)
            
            
            //.border(Color.black.opacity(curColor == color ? 1 : 0))
            
            Text(String(viewModel.getColorID(_color: color)))
            
        }
    }
}

