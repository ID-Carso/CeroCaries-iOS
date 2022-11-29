//
//  MenuSectionButton.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct MenuSectionButton: View {
    
    let sectionText: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Text(sectionText.uppercased())
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: widthScreen * 0.7, height: heightScreen * 0.1, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .background(Color("BlueColor"))
        }
    }
}

struct MenuSectionButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuSectionButton(sectionText: "instituciones que nos avalan")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
