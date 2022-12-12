//
//  ImageInfoView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 05/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct ImageInfoView: View {
    
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}

struct ImageInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageInfoView(image: "clinicabecerra", width: widthScreen * 0.6, height: widthScreen * 0.8)
    }
}
