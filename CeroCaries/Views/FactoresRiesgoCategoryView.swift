//
//  FactoresRiesgoCategoryView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 06/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct FactoresRiesgoCategoryView: View {
    
    @Binding var index: Int
    @Binding var showInfo: Bool
    let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<(factores.count / 2)) { row in
                HStack(spacing: 20) {
                    ForEach(0..<2) { column in
                        Button(action: {
                            index = factores[(row * 2) + column].id - 1
                            print("Index: \(index)")
                            showInfo = true
                        }) {
                            CategoryButtonView(title: factores[(row * 2) + column].titulo)
                        }
                    }
                }
            }
        }
    }
}

struct FactoresRiesgoCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FactoresRiesgoCategoryView(index: .constant(1), showInfo: .constant(false))
    }
}
