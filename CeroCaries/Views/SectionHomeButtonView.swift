//
//  SectionHomeButtonView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct SectionHomeButtonView: View {
    
    @Binding var openView: Bool
    let icon: String
    let sectionText: String
    
    var body: some View {
        Button(action: {
            openView = true
        }) {
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: heightScreen * 0.04, height: heightScreen * 0.04)
                
                Text(sectionText.uppercased())
                    .font(Font(AppFonts.buttonTextBold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(width: widthScreen * 0.6)
            }
            .frame(width: widthScreen * 0.8, height: heightScreen * 0.06)
            .background(Color("LightBlueColor"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct SectionHomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHomeButtonView(openView: .constant(false), icon: "factorIcon", sectionText: "Factores de riesgo")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
