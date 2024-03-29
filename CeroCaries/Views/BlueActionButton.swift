//
//  BlueActionButton.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct BlueActionButton: View {
    
    // MARK: - PROPERTIES
    @Binding var navigationAction: Bool
    let textButton: String
    
    var body: some View {
        Button(action: {
            navigationAction = true
        }) {
            Text(textButton)
            
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .frame(width: widthScreen * 0.6, height: heightScreen * 0.06)
        .background(Color("LightBlueColor"))
        .cornerRadius(15)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
        )
    }
}

struct BlueActionButton_Previews: PreviewProvider {
    static var previews: some View {
        BlueActionButton(navigationAction: .constant(false), textButton: "Iniciar sesión")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
