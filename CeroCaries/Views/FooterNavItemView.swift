//
//  FooterNavItemView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct FooterNavItemView: View {
    
    @Binding var openSection: Bool
    let imageName: String
    let section: String
    
    var body: some View {
        Button(action: {
            openSection = true
        }) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.15, height: widthScreen * 0.15)
                
                Text(section.uppercased())
                    .font(.system(size: 8))
                    .fontWeight(.bold)
            }
        }
    }
}

struct FooterNavItemView_Previews: PreviewProvider {
    static var previews: some View {
        FooterNavItemView(openSection: .constant(false), imageName: "informacion", section: "información")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
