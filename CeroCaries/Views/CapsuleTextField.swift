//
//  CapsuleTextField.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CapsuleTextField: View {
    
    @Binding var text: String
    
    var body: some View {
        TextField("Name", text: $text)
            .frame(width: widthScreen * 0.8)
            .padding()
            .background(
                Capsule().stroke(Color("LightBlueColor"), lineWidth: 2)
            )
    }
}

struct CapsuleTextField_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleTextField(text: .constant(""))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
