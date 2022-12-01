//
//  TextError.swift
//  CeroCaries
//
//  Created by Alex Barreto on 30/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct AssistiveText: View {
    
    // MARK: - PROPERTIES
    let leadingIcon: String?
    let text: String
    let textColor: String
    let alignment: TextAlignment
    
    var body: some View {
        HStack {
            if let leadingIcon = leadingIcon {
                Image(systemName: leadingIcon)
                    .foregroundColor(Color(leadingIcon == "checkmark.circle.fill" ? "GreenColor" : "RedColor"))
            }
            
            Text(text)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .multilineTextAlignment(alignment)
                .foregroundColor(Color(textColor))
        }
    }
}

struct AssistiveText_Previews: PreviewProvider {
    static var previews: some View {
        AssistiveText(leadingIcon: "checkmark.circle.fill", text: "8 caractéres mínimo", textColor: "GrayColor", alignment: .leading)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
