//
//  SeparatorView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 02/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Image("separator")
            .resizable()
            .scaledToFit()
            .frame(width: widthScreen * 0.9)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
