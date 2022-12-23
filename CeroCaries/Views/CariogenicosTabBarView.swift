//
//  CariogenicosTabBarView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 12/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CariogenicosTabBarView: View {
    
    let alimentos: [Cariogenico]
    @State var selected: Cariogenico
    
    init(alimentos: [Cariogenico]) {
        self.alimentos = alimentos
        selected = alimentos[0]
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 5) {
                    Text("Alimentos \(selected.tipo)")
                        .font(Font(AppFonts.buttonTextBold))
                    
                    Text("(\(selected.descripcion))")
                        .font(Font(AppFonts.regularText))
                }
                .frame(width: widthScreen, height: 80)
            }
            .background(Color(selected.bgColor))
            
            HStack {
                ForEach(alimentos) { cariogenico in
                    Button(action: {
                        selected = cariogenico
                    }) {
                        VStack(spacing: 5) {
                            Text(cariogenico.tipo.uppercased())
                                .font(Font(AppFonts.tabText))
                                .foregroundColor(
                                    selected.id == cariogenico.id ? .black : Color("TopBarColor")
                                )
                            
                            if selected.id == cariogenico.id {
                                Rectangle()
                                    .fill(Color(cariogenico.bgColor))
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
                    ForEach(selected.info) { alimento in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(alimento.categoria)
                                .font(Font(AppFonts.regularBoldText))
                            
                            Text(alimento.alimentos)
                                .font(Font(AppFonts.regularText))
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.5))
                                .frame(height: 2)
                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
        }
    }
}

struct CariogenicosTabBarView_Previews: PreviewProvider {
    static let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    static var previews: some View {
        CariogenicosTabBarView(alimentos: factores[0].cariogenicos)
    }
}
