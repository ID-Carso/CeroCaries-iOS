//
//  HomeView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @State var showMenu: Bool = false
    @State var openRisks: Bool = false
    @State var openStories: Bool = false
    @State var openTips: Bool = false
    @State var openTruths: Bool = false
    @State var openHealth: Bool = false
    @State var openSchools: Bool = false
    @State var openAbout: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: HomeFactorsView(), isActive: $openRisks) { EmptyView() }
            
            NavigationLink(destination: LolaPoloView(), isActive: $openStories) { EmptyView() }
            
            NavigationLink(destination: TipsView(), isActive: $openTips) { EmptyView() }
            
            NavigationLink(destination: MitosView(), isActive: $openTruths) { EmptyView() }
            
            NavigationLink(destination: OdontologiaView(), isActive: $openHealth) { EmptyView() }
            
            NavigationLink(destination: CeroCariesView(), isActive: $openAbout) { EmptyView() }
            
            VStack(spacing: 10) {
                AppBarView(showMenu: $showMenu)
                
                VStack {
                    Image("logoNav")
                        .resizable()
                        .scaledToFit()
                        .frame(width: widthScreen * 0.3, height: widthScreen * 0.3)
                    .padding(.bottom, 20)
                    
                    SectionHomeButtonView(openView: $openRisks, icon: "factorIcon", sectionText: "factores de riesgo")
                    SectionHomeButtonView(openView: $openStories, icon: "storieIcon", sectionText: "Aventuras de Lola y Polo")
                    SectionHomeButtonView(openView: $openTips, icon: "tipsIcon", sectionText: "tips para el cuidado dental")
                    SectionHomeButtonView(openView: $openTruths, icon: "realidadesIcon", sectionText: "MITOS Y REALIDADES")
                    SectionHomeButtonView(openView: $openHealth, icon: "odontologiaIcon", sectionText: "Odontología de la salud")
                    
                    Button(action: {
                        if let url = URL(string: "https://www.wikipedia.com") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image("schoolIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: heightScreen * 0.04, height: heightScreen * 0.04)
                            
                            Text("Escuelas libres de caries".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(width: widthScreen * 0.6)
                        }
                        .frame(width: widthScreen * 0.8, height: heightScreen * 0.06)
                        .background(Color("LightBlueColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    SectionHomeButtonView(openView: $openAbout, icon: "infoIcon", sectionText: "qué es cero caries")
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
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .onDisappear {
            showMenu = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11 Pro")
    }
}
