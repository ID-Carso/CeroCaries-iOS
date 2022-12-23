//
//  ResultsFactorsView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 15/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct ResultsFactorsView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var preguntasVM: PreguntasViewModel
    @State var showMenu: Bool = false
    @State var showFactores: Bool = false
    @State var showHome: Bool = false
    
    let riskText: String
    let factor: FactorRiesgo
    
    var body: some View {
        ZStack(alignment: .top) {
            
            NavigationLink(destination: HomeView(), isActive: $showHome) { EmptyView() }
            
            NavigationLink(destination: FactoresRiesgoView(factor: factor, riesgo: preguntasVM.riesgo), isActive: $showFactores) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { showHome = true }, showImage: false, titleSection: "Factores de riesgo")
                    .offset(y: -20)
                
                VStack {
                    Text(factor.nombre)
                        .font(Font(AppFonts.headerSectionTitle))
                        .foregroundColor(Color.gray)
                    
                    Text("Resultado".uppercased())
                        .font(Font(AppFonts.headerSectionTitle))
                        .foregroundColor(Color("LightBlueColor"))
                }
                
                VStack(spacing: 10) {
                    Text("Ingresaste \(preguntasVM.totalAfirmativas) respuestas afirmativas")
                        .font(Font(AppFonts.headerSectionTitle))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .padding(.vertical, 20)
                        .frame(width: widthScreen * 0.6)
                    
                    DonutChart(chartData: [ChartData(color: Color(preguntasVM.averageColor), percent: CGFloat(preguntasVM.average), value: CGFloat(preguntasVM.average), total: preguntasVM.average)])
                    
                    Text("Tu nivel de riesgo es:")
                        .font(Font(AppFonts.headerSectionTitle))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .frame(width: widthScreen * 0.6)
                    
                    Text(preguntasVM.riesgo)
                        .font(Font(AppFonts.blackResult))
                        .foregroundColor(preguntasVM.riesgo == "Alto" ? Color(preguntasVM.averageColor) : .black)
                }
                .padding(.vertical, 20)
                
                BlueActionButton(navigationAction: $showFactores, textButton: "Ver factores riesgo", width: widthScreen * 0.6, height: heightScreen * 0.05)
                
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

struct ResultsFactorsView_Previews: PreviewProvider {
    static let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    static var previews: some View {
        ResultsFactorsView(preguntasVM: PreguntasViewModel(generales: 6, locales: 6), riskText: "Riesgo Alto", factor: factores[0])
    }
}
