//
//  OdontologiaView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct OdontologiaView: View {
    
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { returnHome = true }, showImage: true, titleSection: "Odontología de la salud")
                    .offset(y: -20)
                
                VStack(spacing: 20) {
                    Image("mainImage")
                        .resizable()
                        .scaledToFit()
                    
                    SeparatorView()
                    
                    TextPointView()
                    
                    TextPointView()
                    
                    TextPointView()
                    
                    BlueActionButton(navigationAction: $showMenu, textButton: "Leer más")
                }
                
                Spacer()
                
                FooterLineView()
            }
            .frame(width: widthScreen)
            .onTapGesture {
                showMenu = false
            }
            
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

struct OdontologiaView_Previews: PreviewProvider {
    static var previews: some View {
        OdontologiaView()
            .previewDevice("iPhone 11 Pro")
    }
}
