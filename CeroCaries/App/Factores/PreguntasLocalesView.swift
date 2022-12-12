//
//  PreguntasLocalesView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 06/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct PreguntasLocalesView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    @State var showResults: Bool = false
    @State var showAlert: Bool = false
    @State var showCariogenicos: Bool = false
    @State var showICDAS: Bool = false
    @State var descriptionAlert: String = ""
    
    @State var answers: [Int] = []
    
    let factor: FactorRiesgo
    
    init(factor: FactorRiesgo) {
        self.factor = factor
        self.answers = Array(repeating: 9, count: factor.factores_locales.count)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            NavigationLink(destination: FactoresRiesgoView(factoresText: factor.factores_texto, definicion: factor.definicion), isActive: $showResults) { EmptyView() }
            
            NavigationLink(destination: CariogenicosView(), isActive: $showCariogenicos) { EmptyView() }
            
            NavigationLink(destination: ICDASView(), isActive: $showICDAS) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: false, titleSection: "Factores de riesgo")
                    .offset(y: -20)
                
                PreguntasHeaderView(typeQuestions: "Locales", factorCategory: factor.nombre)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(factor.factores_locales) { pregunta in
                            VStack {
                                HStack(alignment: .top) {
                                    Text("\(pregunta.id)")
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 20, height: 20)
                                        .background(Color("LightBlueColor"))
                                        .clipShape(Circle())
                                    
                                    Text(pregunta.pregunta)
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                }
                                
                                if pregunta.info_type > 0 {
                                    Button(action: {
                                        switch pregunta.info_type {
                                        case 1:
                                            showCariogenicos = true
                                        case 2:
                                            descriptionAlert = pregunta.description
                                            showAlert = true
                                        case 3:
                                            showICDAS = true
                                        default:
                                            break
                                        }
                                    }) {
                                        Text("leer más")
                                            .foregroundColor(.white)
                                            .frame(width: widthScreen * 0.25, height: heightScreen * 0.03)
                                            .background(Color("OrangeButtonColor"))
                                            .clipShape(
                                                RoundedRectangle(cornerRadius: 15)
                                            )
                                    }
                                }
                                
                                HStack(spacing: 40) {
                                    Button(action: {
                                        answers[pregunta.id - 1] = 1
                                    }) {
                                        Text("Sí")
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black)
                                            .frame(width: 30, height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                    
                                    Button(action: {
                                        answers[pregunta.id - 1] = 0
                                    }) {
                                        Text("No")
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black)
                                            .frame(width: 30, height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                }
                                .padding(.vertical, 20)
                                
                                SeparatorView()
                            }
                        }
                        
                        BlueActionButton(navigationAction: $showMenu, textButton: "Siguiente", width: widthScreen * 0.6, height: heightScreen * 0.06)
                    }
                    .padding(.horizontal, 20)
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
            
            if showAlert {
                CustomAlert(title: "", message: descriptionAlert, dismissButton: CustomAlertButton(title: "Cerrar", action: { showAlert = false }), primaryButton: nil, secondaryButton: nil)
            }
        }
        .background(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .onDisappear {
            showMenu = false
        }
    }
}

struct PreguntasLocalesView_Previews: PreviewProvider {
    static let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    static var previews: some View {
        PreguntasLocalesView(factor: factores[2])
    }
}
