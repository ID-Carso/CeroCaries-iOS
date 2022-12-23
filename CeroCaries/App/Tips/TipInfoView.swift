//
//  TipInfoView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 05/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct TipInfoView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @Binding var index: Int
    
    let tips: [Tip] = Bundle.main.decode("Tips.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: false, titleSection: "Tips para el cuidado bucodental")
                    .offset(y: -20)
                
                TipsTabView(index: $index, tips: tips)
                
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

struct TipInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TipInfoView(index: .constant(1))
    }
}
