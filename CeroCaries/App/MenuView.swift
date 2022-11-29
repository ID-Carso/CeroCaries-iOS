//
//  MenuView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 50) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.7, height: heightScreen * 0.2)
                    .padding(.top, 40)
                
                MenuSectionButton(sectionText: "compartir en rrss")
                
                MenuSectionButton(sectionText: "instituciones que nos avalan")
                
                Spacer()
                
                Image("logoNav")
                    .padding(.bottom, 30)
            }
            .frame(width: widthScreen * 0.8)
            .background(Color("LightBlueButtonColor"))
            .offset(x: showMenu ? (widthScreen * -0.1) : (widthScreen * -1), y: 0)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: .constant(true))
    }
}
