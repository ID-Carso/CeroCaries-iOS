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
    @State var showMenu: Bool = false
    @State var showSettings: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                AppBarView(showMenu: $showMenu, showSettings: $showSettings)
                
                HeaderSectionView(titleSection: "Patrocinadores y colaboradores")
                    .offset(y: -20)
                
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
