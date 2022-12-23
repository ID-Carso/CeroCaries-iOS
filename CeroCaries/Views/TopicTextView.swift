//
//  TopicTextView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct TopicTextView: View {
    
    let bgColor: String
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.uppercased())
                .font(Font(AppFonts.buttonTextBold))
                .foregroundColor(Color(bgColor))
            
            Text(text)
                .font(Font(AppFonts.regularBoldText))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color(bgColor))
                .frame(width: widthScreen * 0.8)
        }
        .padding(.horizontal)
    }
}

struct TopicTextView_Previews: PreviewProvider {
    static var previews: some View {
        TopicTextView(bgColor: "BlueColor", title: "Mito", text: "\"Las limpiezas dentales son perjudiciales para el esmalte.\"")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
