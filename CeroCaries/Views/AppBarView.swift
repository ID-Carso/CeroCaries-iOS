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
    @Binding var showSettings: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            
            AppBarShape()
                .frame(width: widthScreen, height: heightScreen * 0.16)
                .foregroundColor(Color("LightBlueColor"))
            
            AppBarShape()
                .frame(width: widthScreen, height: heightScreen * 0.15)
                .foregroundColor(Color("TopBarColor"))
            
            
            HStack {
                Button(action: {
                    showMenu.toggle()
                }) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(Color("BlueColor"))
                }
                .padding(.leading, 20)

                Spacer()

                Image("logo")

                Spacer()

                Button(action: {
                    showSettings.toggle()
                }) {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color("BlueColor"))
                        .padding(.trailing, 20)
                }
            }
            .frame(width: widthScreen, height: heightScreen * 0.1)
        }
    }
}

struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView(showMenu: .constant(false), showSettings: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
