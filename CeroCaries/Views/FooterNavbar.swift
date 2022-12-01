//
//  FooterNavbar.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct FooterNavbar: View {
    
    @Binding var openInfo: Bool
    @Binding var openChildren: Bool
    @Binding var openCalendar: Bool
    @Binding var openExp: Bool
    @Binding var openContact: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                FooterNavItemView(openSection: $openInfo, imageName: "informacion", section: "Información")
                
                FooterNavItemView(openSection: $openChildren, imageName: "niños", section: "niños")
                
                FooterNavItemView(openSection: $openCalendar, imageName: "calendario", section: "Calendario")
                
                FooterNavItemView(openSection: $openExp, imageName: "expediente", section: "Expediente")
                
                FooterNavItemView(openSection: $openContact, imageName: "contacto", section: "contacto")
            }
            
            Image("navbarbutton")
                .resizable()
                .scaledToFit()
                .frame(width: widthScreen * 0.9)
        }
    }
}

struct FooterNavbar_Previews: PreviewProvider {
    static var previews: some View {
        FooterNavbar(openInfo: .constant(false), openChildren: .constant(false), openCalendar: .constant(false), openExp: .constant(false), openContact: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
