//
//  IcdasTabView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 22/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct IcdasTabView: View {
    
    // MARK: - PROPERTIES
    @State var selected: ICDA
    let icdas: [ICDA]
    
    init() {
        icdas = Bundle.main.decode("icdas.json")
        selected = icdas[0]
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(icdas) { icda in
                    Button(action: {
                        selected = icda
                    }) {
                        VStack(spacing: 5) {
                            Text(icda.tabTitle.uppercased())
                                .font(Font(AppFonts.regularBoldText))
                                .foregroundColor(
                                    selected.id == icda.id ? .black : Color("TopBarColor")
                                )
                            
                            if selected.id == icda.id {
                                Rectangle()
                                    .fill(Color("LightBlueColor"))
                                    .frame(height: 3)
                            } else {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(height: 3)
                            }
                        }
                    }
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    SeparatorView()
                        .frame(height: heightScreen * 0.01)
                    
                    ForEach(selected.info) { info in
                        VStack(alignment: .center, spacing: 5) {
                            HStack{
                                Image(info.arrow)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: widthScreen / 4, height: (widthScreen / 4) * CGFloat(info.image.count))
                                
                                Text(info.type)
                                    .font(Font(AppFonts.blackResult))
                                    .frame(width: widthScreen / 4, height: widthScreen / 4)
                                
                                VStack(alignment: .center, spacing: 5) {
                                    ForEach(info.image, id: \.self) { img in
                                        Image(img)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: widthScreen / 4, height: widthScreen / 4)
                                    }
                                }
                            }
                            
                            SeparatorView()
                                .frame(height: heightScreen * 0.01)
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
        }
    }
}

struct IcdasTabView_Previews: PreviewProvider {
    static let icdas: [ICDA] = Bundle.main.decode("icdas.json")
    
    static var previews: some View {
        IcdasTabView()
    }
}
