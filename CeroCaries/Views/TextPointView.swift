//
//  TextPointView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct TextPointView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "circle.fill")
                .font(.system(size: 10))
                .foregroundColor(Color("LightBlueColor"))
                .frame(width: 20, height: 20)
            Text("El programa Generación Cero es el resultado...")
                .font(.system(size: 18))
                .fontWeight(.semibold)
        }
    }
}

struct TextPointView_Previews: PreviewProvider {
    static var previews: some View {
        TextPointView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}