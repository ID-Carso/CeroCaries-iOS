//
//  CuidadosDentalesView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 13/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CuidadosDentalesView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    @State var showBibliografia: Bool = false
    
    let titleSection: String
    let cuidados: [CuidadoDental]
    let bibliografia: [String]
    let riesgo: String
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            NavigationLink(destination: BibliografiaView(refs: bibliografia), isActive: $showBibliografia) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: false, titleSection: titleSection)
                    .offset(y: -20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Clasificación de riesgo".uppercased())
                                .font(Font(AppFonts.buttonTextBold))
                                .multilineTextAlignment(.center)
                                .frame(width: widthScreen / 2, height: heightScreen * 0.1)
                                .background(Color("tratamientoColor"))
                                
                            Text("Riesgo \(riesgo)".uppercased())
                                .font(Font(AppFonts.regularBoldText))
                                .frame(width: widthScreen / 2, height: heightScreen * 0.1)
                                .background(Color("lightGreenColor"))
                        }
                        .frame(width: widthScreen, height: heightScreen * 0.1)
                        
                        ForEach(cuidados) { cuidado in
                            HStack(alignment: .center, spacing: 0) {
                                Text(cuidado.tratamiento)
                                    .font(Font(AppFonts.regularText))
                                    .padding(10)
                                    .frame(width: widthScreen / 2, height: heightScreen * 0.15)
                                    .border(.gray, width: 0.5)
                                
                                switch riesgo {
                                case "Bajo":
                                    Text(cuidado.bajo)
                                        .font(Font(AppFonts.regularText))
                                        .frame(width: widthScreen / 2, height: heightScreen * 0.15)
                                        .border(.gray, width: 0.5)
                                case "Moderado":
                                    Text(cuidado.medio)
                                        .font(Font(AppFonts.regularText))
                                        .frame(width: widthScreen / 2, height: heightScreen * 0.15)
                                        .border(.gray, width: 0.5)
                                case "Alto":
                                    Text(cuidado.alto)
                                        .font(Font(AppFonts.regularText))
                                        .frame(width: widthScreen / 2, height: heightScreen * 0.15)
                                        .border(.gray, width: 0.5)
                                default:
                                    Text(cuidado.bajo)
                                        .font(Font(AppFonts.regularText))
                                        .frame(width: widthScreen / 2, height: heightScreen * 0.15)
                                        .border(.gray, width: 0.5)
                                }
                            }
                            .frame(width: widthScreen, height: heightScreen * 0.15)
                        }
                        
                        Text("* Aspectos clinicos que serán indicados según las necesidades del paciente por odontopediatra certificado.")
                            .font(Font(AppFonts.regularText))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 40)
                        
                        BlueActionButton(navigationAction: $showBibliografia, textButton: "Ver bibliografía", width: widthScreen * 0.6, height: heightScreen * 0.06)
                    }
                }
                .frame(width: widthScreen)
                
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

// MARK: - PREVIEW
struct CuidadosDentalesView_Previews: PreviewProvider {
    static let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    static var previews: some View {
        CuidadosDentalesView(titleSection: "Cuidados dentales en casa", cuidados: factores[0].cuidados_dentales, bibliografia: factores[0].bibliografia, riesgo: "Alto")
    }
}
