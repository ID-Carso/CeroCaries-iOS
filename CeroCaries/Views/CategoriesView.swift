//
//  CategoriesView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 05/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
    
    @Binding var index: Int
    @Binding var showInfo: Bool
    let tips: [Tip]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<(tips.count / 2)) { row in
                HStack(spacing: 20) {
                    ForEach(0..<2) { column in
                        Button(action: {
                            index = tips[(row * 2) + column].id
                            showInfo = true
                        }) {
                            CategoryButtonView(title: tips[(row * 2) + column].titulo)
                        }
                    }
                }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static let tips: [Tip] = Bundle.main.decode("Tips.json")
    
    static var previews: some View {
        CategoriesView(index: .constant(1), showInfo: .constant(false), tips: tips)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
