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
    @State var index: Int = 0
    
    let cuentos: [Cuento] = Bundle.main.decode("cuentos.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("niñosfondo")
                .resizable()
                .frame(width: widthScreen)
            
            NavigationLink(destination: HomeView(), isActive: $returnHome) { EmptyView() }
            
            NavigationLink(destination: CuentoView(cuento: cuentos[index]), isActive: $showReinoGolosinas) { EmptyView() }
            
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
                            .foregroundColor(.white)
                            .background(Color("LightBlueColor"))
                            .clipShape(Circle())
                            .shadow(color: Color.gray, radius: 5, x: 2, y: 2)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                }
                
                Text("Acompaña a Lola\ny Polo en sus aventuras")
                    .font(Font(AppFonts.blackTitle))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("BlueColor"))
                
                Text("Selecciona una historia")
                    .font(Font(AppFonts.regularBoldText))
                    .padding(.vertical, 10)
                
                ForEach(cuentos) { cuento in
                    Button(action: {
                        index = cuento.id - 1
                        showReinoGolosinas = true
                    }) {
                        Text(cuento.titulo)
                            .font(Font(AppFonts.secondaryActionButtonText))
                            .foregroundColor(.white)
                            .frame(width: widthScreen * 0.6, height: heightScreen * 0.07)
                            .background(Color("LightBlueColor"))
                            .cornerRadius(15)
                    }
                    .padding(.bottom, 20)
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

struct LolaPoloView_Previews: PreviewProvider {
    static var previews: some View {
        LolaPoloView()
    }
}
