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
        ZStack {
            
            GeometryReader { _ in
                VStack(spacing: 25) {
                    Image("logoslidemenu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: widthScreen * 0.6, height: heightScreen * 0.2)
                        .padding(.top, 40)
                    
                    MenuSectionButton(sectionText: "compartir en rrss")
                
                    MenuSectionButton(sectionText: "instituciones que nos avalan")
                
                    Spacer()
                
                    Image("footermenulogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: widthScreen * 0.3, height: widthScreen * 0.3)
                        .padding(.bottom, 30)
                }
                .frame(width: widthScreen * 0.8)
                .background(Color.white)
                .opacity(showMenu ? 1 : 0)
                .offset(x: showMenu ? 0 : -widthScreen)
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                .animation(.easeIn(duration: 0.6))
                .gesture(
                    DragGesture()
                        .onEnded { translation in
                            
                            if translation.translation.width < -20 {
                                withAnimation {
                                    showMenu = false
                                }
                            }
                        }
                )
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: .constant(true))
    }
}
