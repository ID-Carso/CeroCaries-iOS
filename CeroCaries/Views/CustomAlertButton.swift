//
//  CustomAlertButton.swift
//  CeroCaries
//
//  Created by Alex Barreto on 07/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CustomAlertButton: View {

    // MARK: - Value
    // MARK: Public
    let title: LocalizedStringKey
    var action: (() -> Void)? = nil
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        Button {
          action?()
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
        }
        .frame(width: widthScreen * 0.5, height: heightScreen * 0.06)
        .background(Color("LightBlueColor"))
        .cornerRadius(15)
    }
}

struct CustomAlertButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertButton(title: "Cerrar")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
