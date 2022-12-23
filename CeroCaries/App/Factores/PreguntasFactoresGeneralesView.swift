//
//  PreguntasFactoresGeneralesView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 06/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct PreguntasFactoresGeneralesView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var preguntasVM: PreguntasViewModel
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    @State var showLocales: Bool = false
    @State var showAlert: Bool = false
    @State var showCariogenicos: Bool = false
    @State var showICDAS: Bool = false
    @State var descriptionAlert: String = ""
    
    let factor: FactorRiesgo
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            NavigationLink(destination: PreguntasLocalesView(preguntasVM: preguntasVM, factor: factor), isActive: $showLocales) { EmptyView() }
            
            NavigationLink(destination: CariogenicosView(alimentos: factor.cariogenicos), isActive: $showCariogenicos) { EmptyView() }
            
            NavigationLink(destination: ICDASView(), isActive: $showICDAS) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: false, titleSection: "Factores de riesgo")
                    .offset(y: -20)
                
                PreguntasHeaderView(typeQuestions: "Generales", factorCategory: factor.nombre)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(factor.factores_generales) { pregunta in
                            QuestionView(showCariogenicos: $showCariogenicos, descriptionAlert: $descriptionAlert, showAlert: $showAlert, showICDAS: $showICDAS, pregunta: pregunta, yesAction: {
                                preguntasVM.cuidadosGenerales[pregunta.id - 1] = 2
                                print(preguntasVM.cuidadosGenerales)
                                }, noAction: {
                                    preguntasVM.cuidadosGenerales[pregunta.id - 1] = 1
                                    print(preguntasVM.cuidadosGenerales)
                                }
                            )
                        }
                        
                        Button(action: {
                            if preguntasVM.checkAnswersGenerales() {
                                showLocales = true
                            } else {
                                descriptionAlert = "Para continuar debes responder todas las preguntas."
                                showAlert = true
                            }
                        }) {
                            Text("Siguiente")
                                .font(Font(AppFonts.secondaryActionButtonText))
                                .foregroundColor(.white)
                                .frame(width: widthScreen * 0.6, height: heightScreen * 0.06)
                                .background(Color("LightBlueColor"))
                                .cornerRadius(15)
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                )
                        }
                        
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

struct PreguntasFactoresGeneralesView_Previews: PreviewProvider {
    static let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    static var previews: some View {
        PreguntasFactoresGeneralesView(preguntasVM: PreguntasViewModel(generales: factores[0].factores_generales.count, locales: factores[0].factores_locales.count), factor: factores[0])
    }
}
