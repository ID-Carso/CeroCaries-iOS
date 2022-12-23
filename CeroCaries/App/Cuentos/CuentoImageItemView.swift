//
//  CuentoImageItemView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 21/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CuentoImageItemView: View {
    
    let image: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(image)
                .resizable()
                .frame(width: widthScreen, height: heightScreen * 0.85)
        }
    }
}

struct CuentoImageItemView_Previews: PreviewProvider {
    static var previews: some View {
        CuentoImageItemView(image: "batallasucia")
    }
}
