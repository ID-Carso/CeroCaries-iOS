//
//  PreguntasHeaderView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 06/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct PreguntasHeaderView: View {
    
    let typeQuestions: String
    let factorCategory: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(typeQuestions.uppercased())
                .font(Font(AppFonts.regularBoldText))
                .foregroundColor(Color("LightBlueColor"))
            
            Image("verticalbar")
                .resizable()
                .scaledToFit()
            
            Text(factorCategory.uppercased())
                .font(Font(AppFonts.regularBoldText))
                .foregroundColor(.gray)
        }
        .frame(height: heightScreen * 0.03)
    }
}

struct PreguntasHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PreguntasHeaderView(typeQuestions: "Generales", factorCategory: "0 a 6 años")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
