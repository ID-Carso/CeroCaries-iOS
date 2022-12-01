//
//  HeaderSectionView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 30/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct HeaderSectionView: View {
    
    let titleSection: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Image(systemName: "chevron.left.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("TopBarColor"))
                .background(Color("LightBlueColor"))
                .clipShape(Circle())
                .padding(.horizontal, 20)
            
            VStack(alignment: .center) {
                Image("logoNav")
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.25, height: widthScreen * 0.25)
                
                Text(titleSection.uppercased())
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(width: widthScreen * 0.4)
            }
            .frame(width: widthScreen * 0.6)
            
            Spacer()
            
        }
        .frame(width: widthScreen)
    }
}

struct HeaderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSectionView(titleSection: "Calendario")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
