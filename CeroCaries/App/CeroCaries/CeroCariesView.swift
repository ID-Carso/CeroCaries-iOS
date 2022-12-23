//
//  CeroCariesView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 02/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CeroCariesView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    @State var showCeroCariesInfo: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            NavigationLink(destination: CeroCariesInfoView(), isActive: $showCeroCariesInfo) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: true, titleSection: "qué es cero caries")
                    .offset(y: -20)
                
                VStack(spacing: 20) {
                    Image("mainImage")
                        .resizable()
                        .scaledToFit()
                    
                    SeparatorView()
                    
                    TextPointView(textInfo: "El Programa Generación Cero es el resultado...")
                    
                    TextPointView(textInfo: "El Programa Generación Cero es el resultado...")
                    
                    TextPointView(textInfo: "El Programa Generación Cero es el resultado...")
                    
                    BlueActionButton(navigationAction: $showCeroCariesInfo, textButton: "Leer más", width: widthScreen * 0.6, height: heightScreen * 0.06)
                }
                
                Spacer()
                
                FooterLineView()
            }
            .frame(width: widthScreen)
            .onTapGesture {
                showMenu = false
            }
            .overlay(
                Rectangle()
                    .fill(
                        Color.primary.opacity(showMenu ? 0.1 : 0.0)
                    )
                    .onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                }
            )
            
            MenuView(showMenu: $showMenu)
        }
        .background(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .onDisappear {
            showMenu = false
        }
    }
}

struct CeroCariesView_Previews: PreviewProvider {
    static var previews: some View {
        CeroCariesView()
    }
}
