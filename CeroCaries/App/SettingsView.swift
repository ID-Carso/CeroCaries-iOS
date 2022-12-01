//
//  SettingsView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 30/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSettings: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                VStack(spacing: 20) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: widthScreen * 0.7, height: heightScreen * 0.2)
                        .padding(.top, 40)
                    
                    MenuSectionButton(sectionText: "Ver perfil")
                
                    MenuSectionButton(sectionText: "tutorial")
                    
                    MenuSectionButton(sectionText: "elegir al personaje")
                    
                    MenuSectionButton(sectionText: "cerrar sesión")
                
                    Spacer()
                
                    Image("logoNav")
                        .padding(.bottom, 30)
                }
                .frame(width: widthScreen * 0.8)
                .background(Color("LightBlueColor"))
                .opacity(showSettings ? 1 : 0)
                .offset(x: showSettings ? 0 : -widthScreen)
                .animation(.easeIn(duration: 0.6))
                .gesture(
                    DragGesture()
                        .onEnded { translation in
                            
                            if translation.translation.width < -20 {
                                withAnimation {
                                    showSettings = false
                                }
                            }
                        }
                )
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSettings: .constant(true))
    }
}
