//
//  FactoresRiesgoView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 06/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct FactoresRiesgoView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    @State var showCuidadosCasa: Bool = false
    @State var showCuidadosConsultorio: Bool = false
    
    let factoresText: String
    let definicion: String
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: false, titleSection: "Factores de riesgo")
                    .offset(y: -20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        Text(factoresText)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Definición:")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Text(definicion)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        
                        BlueActionButton(navigationAction: $showCuidadosCasa, textButton: "Cuidados dentales en casa", width: widthScreen * 0.8, height: heightScreen * 0.06)
                        
                        BlueActionButton(navigationAction: $showCuidadosConsultorio, textButton: "Cuidados dentales\nprofesionales en consultorio", width: widthScreen * 0.8, height: heightScreen * 0.1)
                    }
                    .padding(.top, 20)
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

struct FactoresRiesgoView_Previews: PreviewProvider {
    static let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    static var previews: some View {
        FactoresRiesgoView(factoresText: factores[0].factores_texto, definicion: factores[0].definicion)
    }
}
