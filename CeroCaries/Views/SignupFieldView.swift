//
//  SignupFieldView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 30/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct SignupFieldView: View {
    
    @Binding var name: String
    let placeholder: String
    let keyType: UIKeyboardType
    let contentType: UITextContentType
    let icon: String?
    let text: String
    let textColor: String
    
    var body: some View {
        VStack {
            CapsuleTextField(text: $name, placeholder: placeholder, keyboardType: keyType, contentType: contentType)
            
            HStack {
                AssistiveText(leadingIcon: icon, text: text, textColor: textColor, alignment: .leading)
                
                Spacer()
            }
            .frame(width: widthScreen * 0.8)
        }
    }
}

struct SignupFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SignupFieldView(name: .constant(""), placeholder: "Nombre", keyType: .default, contentType: .givenName, icon: "exclamationmark.circle.fill", text: "El nombre del usuario ya está registrado", textColor: "RedColor")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
