//
//  CariogenicosView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 07/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CariogenicosView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: false, titleSection: "Tipos de alimentos según")
                    .offset(y: -20)
                
                Text("Riesgo cariogénico".uppercased())
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color("LightBlueColor"))
                
                
                
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

struct CariogenicosView_Previews: PreviewProvider {
    static var previews: some View {
        CariogenicosView()
    }
}
