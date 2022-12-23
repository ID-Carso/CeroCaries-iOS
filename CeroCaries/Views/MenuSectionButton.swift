//
//  MenuSectionButton.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct MenuSectionButton: View {
    
    @Binding var action: Bool
    let sectionText: String
    
    var body: some View {
        Button(action: {
            action = true
        }) {
            Text(sectionText.uppercased())
                .font(Font(AppFonts.menuSectionText))
                .foregroundColor(.white)
                .frame(width: widthScreen * 0.7, height: heightScreen * 0.08, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .background(Color("LightBlueColor"))
        }
    }
}

struct MenuSectionButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuSectionButton(action: .constant(false), sectionText: "instituciones que nos avalan")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
