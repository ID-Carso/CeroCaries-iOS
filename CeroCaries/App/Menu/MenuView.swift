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
    @State var loadPage: Bool = false
    @State var openIns: Bool = false
    @GestureState var offset: CGFloat = .zero
    
    var body: some View {
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
                .offset(x: showMenu ? offset : -widthScreen)
                .shadow(color: .gray, radius: 5, x: 2, y: 0)
                .animation(.easeOut, value: showMenu)
                .gesture(
                    DragGesture()
                        .updating($offset, body: {
                            value, out, _ in
                            out = value.translation.width
                        })
                        .onEnded { translation in
                            
                            if translation.translation.width < -(widthScreen * 0.4) {
                                //withAnimation {
                                    showMenu = false
                                //}
                            }
                        }
                )
                
                Spacer(minLength: widthScreen * 0.1)
            }
            
//            GeometryReader { _ in
            
//            }
        }
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: "https://apps.apple.com/mx/app/escuder%C3%ADa-telmex/id463374713") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: .constant(true))
    }
}
