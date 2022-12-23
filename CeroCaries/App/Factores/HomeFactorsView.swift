//
//  HomeFactorsView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 02/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct HomeFactorsView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    @State var showCategorySection: Bool = false
    @State var index: Int = 0
    
    let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            NavigationLink(destination: PreguntasFactoresGeneralesView(preguntasVM: PreguntasViewModel(generales: factores[index].factores_generales.count, locales: factores[index].factores_locales.count), factor: factores[index]), isActive: $showCategorySection) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: true, titleSection: "Factores de riesgo")
                    .offset(y: -20)
                
                FactoresRiesgoCategoryView(index: $index, showInfo: $showCategorySection)
                
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

struct HomeFactorsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFactorsView()
    }
}
