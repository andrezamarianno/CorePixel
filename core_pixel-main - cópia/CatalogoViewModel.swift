//
//  CatalogoViewModel.swift
//  CorePixel
//
//  Created by HEITOR IVAZA LOPES on 03/02/25.
//

import Foundation

class CatalogoViewModel {
    var listaDesenhos: [[[Int]]]
    
    init(){
        listaDesenhos = [[[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,0,0,0,-1,-1,0,0,0,-1,-1,-1,-1], [-1,-1,-1,0,1,1,1,0,0,1,1,1,0,-1,-1,-1], [-1,-1,-1,0,1,1,1,1,1,1,1,1,0,-1,-1,-1], [-1,-1,-1,0,1,1,1,1,1,1,1,1,0,-1,-1,-1], [-1,-1,-1,-1,0,1,1,1,1,1,1,0,-1,-1,-1,-1], [-1,-1,-1,-1,-1,0,1,1,1,1,0,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,0,1,1,0,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]], [[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,-1,-1,-1], [-1,-1,-1,0,4,4,4,4,4,4,4,4,0,-1,-1,-1], [-1,-1,-1,0,0,0,0,0,0,0,0,0,0,-1,-1,-1], [-1,-1,-1,0,3,3,3,3,3,1,1,3,0,-1,-1,-1], [-1,-1,-1,0,3,1,1,3,3,1,1,3,0,-1,-1,-1], [-1,-1,-1,-1,0,1,1,3,3,3,3,0,-1,-1,-1,-1], [-1,-1,-1,-1,0,3,3,3,3,3,3,0,-1,-1,-1,-1], [-1,-1,-1,-1,-1,0,3,1,1,3,0,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,0,3,1,1,3,0,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,0,3,3,0,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,0,3,3,0,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]], [[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,0,0,-1,-1,0,0,-1,-1,-1,-1,-1], [-1,-1,-1,-1,0,5,5,0,0,5,5,0,-1,-1,-1,-1], [-1,-1,-1,-1,-1,0,5,5,5,5,0,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,0,0,0,0,0,0,-1,-1,-1,-1,-1], [-1,-1,-1,-1,0,1,1,1,1,1,1,0,-1,-1,-1,-1], [-1,-1,-1,0,1,1,1,1,1,1,1,1,0,-1,-1,-1], [-1,-1,-1,0,1,1,0,1,1,0,1,1,0,-1,-1,-1], [-1,-1,-1,0,1,1,0,1,1,0,1,1,0,-1,-1,-1], [-1,-1,-1,0,1,1,0,1,1,0,1,1,0,-1,-1,-1], [-1,-1,-1,0,1,1,0,1,1,0,1,1,0,-1,-1,-1], [-1,-1,-1,0,1,1,1,1,1,1,1,1,0,-1,-1,-1], [-1,-1,-1,-1,0,1,1,1,1,1,1,0,-1,-1,-1,-1], [-1,-1,-1,-1,-1,0,0,0,0,0,0,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]], [[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]]]
    }
}
