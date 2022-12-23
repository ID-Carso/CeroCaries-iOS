//
//  CustomSideMenu.swift
//  CeroCaries
//
//  Created by Alex Barreto on 23/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CustomSideMenu: View {
    
    // MARK: - PROPERTIES
    @Binding var showMenu: Bool
    @State var openIns: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                NavigationLink(destination: InstitutesView(), isActive: $openIns) { EmptyView() }
                
                HStack {
                    VStack(spacing: 25) {
                        Image("logoslidemenu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: widthScreen * 0.6, height: heightScreen * 0.2)
                            .padding(.top, 40)
                        
                        Button(action: {
                            actionSheet()
                        }) {
                            Text("compartir app".uppercased())
                                .font(Font(AppFonts.menuSectionText))
                                .foregroundColor(.white)
                                .frame(width: widthScreen * 0.7, height: heightScreen * 0.08, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                                .background(Color("LightBlueColor"))
                        }
                    
                        MenuSectionButton(action: $openIns, sectionText: "patrocinadores y colaboradores")
                    
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
                    
                    Spacer(minLength: widthScreen * 0.1)
                }
                
    //            GeometryReader { _ in
                
    //            }
            }
        } //: VSTACK
        .frame(width: widthScreen - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.04)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: "https://apps.apple.com/mx/app/escuder%C3%ADa-telmex/id463374713") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct CustomSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomSideMenu(showMenu: .constant(true))
    }
}
