//
//  MitosView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct MitosView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    
    let info: MitosRealidades = Bundle.main.decode("mitos.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss()
                }, showImage: false, titleSection: "Mitos y realidades")
                
                ScrollView(.vertical, showsIndicators: false) {
                    Image("mitosImage")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        TopicTextView(bgColor: "BlueColor", title: "Mito", text: "\"\(info.mitos)\"")
                        
                        TopicTextView(bgColor: "BackgroundColor", title: "Realidad", text: info.realidades)
                    }
                }
                .frame(width: widthScreen * 0.9,height: heightScreen * 0.55)
                .background(Color("LightBlueColor"))
                .padding(.vertical, 40)
                .padding(.horizontal, 20)
                
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

struct MitosView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            MitosView()
        } else {
            // Fallback on earlier versions
        }
    }
}
