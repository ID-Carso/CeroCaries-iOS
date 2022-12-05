//
//  CeroCariesInfoView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 02/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CeroCariesInfoView: View {
    
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    
    let info: CeroCaries = Bundle.main.decode("cerocaries.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: OdontologiaView(), isActive: $returnHome) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { returnHome = true }, showImage: true, titleSection: "Qué es cero caries")
                    .offset(y: -20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        Image("mainImage")
                            .resizable()
                            .scaledToFit()
                        
                        SeparatorView()
                        
                        // Add text details
                        Text(info.info)
                            .padding(.horizontal)
                        
                    }
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

struct CeroCariesInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CeroCariesInfoView()
    }
}
