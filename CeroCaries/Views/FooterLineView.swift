//
//  FooterLineView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 01/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct FooterLineView: View {
    var body: some View {
        HStack {
            
        }
        .frame(width: widthScreen * 0.95, height: heightScreen * 0.005)
        .background(Color("LightBlueColor"))
        .padding(.bottom, 10)
    }
}

struct FooterLineView_Previews: PreviewProvider {
    static var previews: some View {
        FooterLineView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
