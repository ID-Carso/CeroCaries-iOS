//
//  SignUpView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - PROPERTIES
    @State var showMenu: Bool = false
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var continueAction: Bool = false
    @State var termsAccepted: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        SignupFieldView(name: $name, placeholder: "Nombre", keyType: .default, contentType: .givenName, icon: "exclamationmark.circle.fill", text: "El nombre de usuario ya está registrado", textColor: "RedColor")
                        
                        SignupFieldView(name: $email, placeholder: "Correo electrónico", keyType: .emailAddress, contentType: .emailAddress, icon: "exclamationmark.circle.fill", text: "Correo electrónico no válido", textColor: "RedColor")
                        
                        SignupFieldView(name: $password, placeholder: "Contraseña", keyType: .default, contentType: .password, icon: nil, text: "8 caractéres mínimo", textColor: "GrayColor")
                    }
                    .frame(width: widthScreen)
                    .padding()
                    
                    VStack(spacing: 20) {
                        Text("Elige una categoría")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("LightBlueColor"))
                        
                        AssistiveText(leadingIcon: "exclamationmark.circle.fill", text: "Debes elegir una categoría", textColor: "RedColor", alignment: .center)
                        
                        CapsuleButton(textButton: "Escuela", backgroundColor: "LigthYellowColor")
                        
                        CapsuleButton(textButton: "Individual", backgroundColor: "LightRedColor")
                        
                        CapsuleButton(textButton: "Odontólogo", backgroundColor: "LightBlueButtonColor")
                        
                        TermsControl(aceptTerms: $termsAccepted)
                        
                        BlueActionButton(navigationAction: $continueAction, textButton: "Siguiente")
                        
                        // Add opacity with ternary operation with binding boolean value from viewmodel
                        AssistiveText(leadingIcon: nil, text: "Debes aceptar los términos y condiciones", textColor: "RedColor", alignment: .center)
                    }
                }
                .frame(width: widthScreen)
            }
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
