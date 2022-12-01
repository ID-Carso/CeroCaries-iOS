//
//  TermsControl.swift
//  CeroCaries
//
//  Created by Alex Barreto on 30/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct TermsControl: View {
    
    @Binding var aceptTerms: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                aceptTerms.toggle()
            }) {
                Image(systemName: aceptTerms ? "record.circle" : "circle")
                    .foregroundColor(Color(aceptTerms ? "BlueColor" : "LightBlueColor"))
            }
            
            Button(action: {
                //Open Terms view
            }) {
                HStack(spacing: 0) {
                    Text("Acepto los ")
                        .font(.system(size: 14))
                        .foregroundColor(Color("LightBlueColor"))
                    
                    Text("términos y condiciones")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("LightBlueColor"))
                }
            }
        }
    }
}

struct TermsControl_Previews: PreviewProvider {
    static var previews: some View {
        TermsControl(aceptTerms: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
