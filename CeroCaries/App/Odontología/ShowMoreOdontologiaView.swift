//
//  ShowMoreOdontologiaView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 02/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct ShowMoreOdontologiaView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    
    let info: Odontologia = Bundle.main.decode("odontologia.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: true, titleSection: "Odontología de la salud")
                    .offset(y: -20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        Image("mainImage")
                            .resizable()
                            .scaledToFit()
                        
                        SeparatorView()
                        
                        // Add text details
                        Text(info.odontologia)
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

struct ShowMoreOdontologiaView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMoreOdontologiaView()
    }
}
