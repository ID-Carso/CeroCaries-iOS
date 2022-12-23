//
//  TextPointView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct TextPointView: View {
    
    let textInfo: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "circle.fill")
                .font(.system(size: 10))
                .foregroundColor(Color("LightBlueColor"))
                .frame(width: 20, height: 20)
            Text(textInfo)
                .font(Font(AppFonts.buttonTextBold))
        }
    }
}

struct TextPointView_Previews: PreviewProvider {
    static var previews: some View {
        TextPointView(textInfo: "El programa Generación Cero es el resultado...")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
