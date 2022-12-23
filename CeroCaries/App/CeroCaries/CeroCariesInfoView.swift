//
//  CeroCariesInfoView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 02/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CeroCariesInfoView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    
    let info: CeroCaries = Bundle.main.decode("cerocaries.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: OdontologiaView(), isActive: $returnHome) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: true, titleSection: "Qué es cero caries")
                    .offset(y: -20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        Image("mainImage")
                            .resizable()
                            .scaledToFit()
                        
                        SeparatorView()
                        
                        // Add text details
                        Text(info.info)
                            .font(Font(AppFonts.regularText))
                            .padding(.horizontal)
                        
                        ImageInfoView(image: "infografia", width: widthScreen * 0.8, height: widthScreen * 0.8)
                        
                        SeparatorView()
                        
                        Text(info.info2)
                            .font(Font(AppFonts.regularText))
                            .padding(.horizontal)
                        
                        ImageInfoView(image: "clinicabecerra", width: widthScreen * 0.6, height: widthScreen * 0.8)
                        
                        SeparatorView()
                        
                        Text(info.info3)
                            .font(Font(AppFonts.regularText))
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

struct CeroCariesInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CeroCariesInfoView()
    }
}
