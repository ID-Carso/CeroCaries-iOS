//
//  LolaPoloView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 02/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct LolaPoloView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    @State var showReinoGolosinas: Bool = false
    @State var showBatallaSucia: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("niñosfondo")
                .resizable()
                .frame(width: widthScreen)
            
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("TopBarColor"))
                            .background(Color("LightBlueColor"))
                            .clipShape(Circle())
                        .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                }
                
                Text("Acompaña a Lola\ny Polo en sus aventuras")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("BlueColor"))
                
                Text("Selecciona una historia")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                
                BlueActionButton(navigationAction: $showReinoGolosinas, textButton: "Lola y Polo en:\nReino de las golosinas", width: widthScreen * 0.6, height: heightScreen * 0.07)
                    .padding(.bottom, 20)
                
                BlueActionButton(navigationAction: $showBatallaSucia, textButton: "Lola y Polo en:\nUna batalla sucia", width: widthScreen * 0.6, height: heightScreen * 0.07)
                
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

struct LolaPoloView_Previews: PreviewProvider {
    static var previews: some View {
        LolaPoloView()
    }
}
