//
//  CategoryButtonView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 05/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CategoryButtonView: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title.uppercased())
                .font(.system(size: 24))
                .fontWeight(.bold)
            .foregroundColor(.white)
            
            Text("años".uppercased())
                .font(.system(size: 16))
                .foregroundColor(.white)
        }
        .frame(width: widthScreen * 0.3, height: widthScreen * 0.3)
        .background(Color("LightBlueColor"))
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
    }
}

struct CategoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonView(title: "12 a 18")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
