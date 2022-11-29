//
//  MainView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 29/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - PROPERTIES
    @State var openLogin: Bool = false
    @State var openSignUp: Bool = false
    @State var openGuest: Bool = false
    @State var showMenu: Bool = false
    @State var showSettings: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(destination: LoginView(), isActive: $openLogin) { EmptyView() }
            
            NavigationLink(destination: SignUpView(), isActive: $openSignUp) { EmptyView() }
            
            NavigationLink(destination: HomeView(), isActive: $openGuest) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu, showSettings: $showSettings)
                
                Image("logoNav")
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.5, height: widthScreen * 0.5)
                    .padding(.bottom, 20)
                
                BlueActionButton(navigationAction: $openLogin, textButton: "Iniciar sesión")
                    .padding(.vertical, 20)
                
                BlueActionButton(navigationAction: $openSignUp, textButton: "Crear cuenta")
                    .padding(.vertical, 20)
                
                BlueActionButton(navigationAction: $openGuest, textButton: "Ingresar sin registro")
                    .padding(.vertical, 20)
                
                Spacer()
            }
            .onTapGesture {
                showMenu = false
                showSettings = false
            }
            
            MenuView(showMenu: $showMenu)
        }
        .background(Color("BackgroundColor"))
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .onDisappear {
            showMenu = false
            showSettings = false
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 11 Pro")
            MainView()
                .previewDevice("iPhone 8")
        }
    }
}
