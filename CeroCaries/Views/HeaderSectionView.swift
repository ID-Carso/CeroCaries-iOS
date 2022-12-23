//
//  HeaderSectionView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 30/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct HeaderSectionView: View {
    
    var dismissAction: (() -> Void)
    let showImage: Bool
    let titleSection: String
    
    var body: some View {
        HStack(alignment: showImage ? .top : .center, spacing: 0) {
            Button(action: {
                dismissAction()
            }) {
                Image(systemName: "chevron.left.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(Color("LightBlueColor"))
                    .clipShape(Circle())
                    .padding(.horizontal, 20)
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
            }
            
            VStack(alignment: .center) {
                if showImage {
                    Image("logoNav")
                        .resizable()
                        .scaledToFit()
                        .frame(width: widthScreen * 0.25, height: widthScreen * 0.25)
                }
                
                Text(titleSection.uppercased())
                    .font(Font(AppFonts.headerSectionTitle))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(width: showImage ? widthScreen * 0.8 : widthScreen * 0.6)
            }
            .frame(width: widthScreen * 0.6)
            
            Spacer()
            
        }
        .frame(width: widthScreen)
    }
}

/*struct HeaderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSectionView(dismissAction: dismiss(), showImage: false, titleSection: "Calendario")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}*/
