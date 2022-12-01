//
//  CapsuleButton.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CapsuleButton: View {
    
    // MARK: - PROPERTIES
    let textButton: String
    let backgroundColor: String
    
    var body: some View {
        Button(action: {}) {
            Text(textButton)
                .foregroundColor(Color("BlueColor"))
                .padding()
        }
        .frame(width: widthScreen * 0.5, height: heightScreen * 0.05)
        .background(Color(backgroundColor))
        .cornerRadius(30)
        .background(
            Capsule()
                .stroke(Color("BlueColor"),lineWidth: 2)
        )
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(textButton: "Escuela", backgroundColor: "LigthYellowColor")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
