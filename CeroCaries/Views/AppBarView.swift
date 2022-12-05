//
//  AppBarView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 28/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct AppBarView: View {
    
    @Binding var showMenu: Bool
//    @Binding var showSettings: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            
            AppBarShape()
                .frame(width: widthScreen, height: heightScreen * 0.16)
                .foregroundColor(Color("LightBlueColor"))
            
            AppBarShape()
                .frame(width: widthScreen, height: heightScreen * 0.15)
                .foregroundColor(.white)
            
            
            HStack {
                ZStack(alignment: .leading) {
                    Button(action: {
                        showMenu.toggle()
                    }) {
                        Image("menuIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("BlueColor"))
                    }

                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                        .frame(width: widthScreen * 0.3, height: heightScreen * 0.05)
                    }
                    .frame(width: widthScreen * 0.90)
                }

                /*Button(action: {
                    showSettings.toggle()
                }) {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color("BlueColor"))
                        .padding(.trailing, 20)
                }*/
            }
            .frame(width: widthScreen, height: heightScreen * 0.1)
        }
    }
}

struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView(showMenu: .constant(false))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
