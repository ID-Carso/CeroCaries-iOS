//
//  InstitutesView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 30/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct InstitutesView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var returnHome: Bool = false
    
    let patrocinadores: Patrocinador = Bundle.main.decode("patrocinadores.json")
    
    var body: some View {
        ZStack {
            VStack {
                AppBarView(showMenu: $showMenu)
                
                HeaderSectionView(dismissAction: { self.presentationMode.wrappedValue.dismiss() }, showImage: true, titleSection: patrocinadores.titleSection)
                    .offset(y: -20)
                
                VStack {
                    ForEach(0..<(patrocinadores.patrocinadores.count / 3), id: \.self) { row in
                        HStack {
                            ForEach(0..<3, id: \.self) { column in
                                Image(patrocinadores.patrocinadores[(row * 3) + column])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: widthScreen * 0.25, height: heightScreen * 0.1)
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct InstitutesView_Previews: PreviewProvider {
    static var previews: some View {
        InstitutesView()
    }
}
