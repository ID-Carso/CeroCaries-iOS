//
//  TipsTabView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 05/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct TipsTabView: View {
    
    @Binding var index: Int
    let tips: [Tip]
    
    func setupAppearance() {
        if #available(iOS 14.0, *) {
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("BlueColor"))
        } else {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
        }
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            TabView(selection: $index) {
                ForEach(tips) { tip in
                    VStack {
                        Text(tip.nombre)
                            .font(Font(AppFonts.headerSectionTitle))
                            .foregroundColor(Color("BlueColor"))
                        
                        ZStack {
                            Image(tip.background)
                                .resizable()
                                .scaledToFit()
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 20) {
                                    Image(tip.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: widthScreen * 0.8, height: heightScreen * 0.22)
                                        .padding(5)
                                    
                                    Text(tip.tip)
                                        .font(Font(AppFonts.regularText))
                                    
                                    Spacer()
                                    
                                }
                                .padding(15)
                            }
                            .frame(width: widthScreen * 0.9, height: heightScreen * 0.5)
                            
                        }
                    }
                    .tag(tip.id)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .tint(Color("BlueColor"))
            .onAppear {
                setupAppearance()
            }
        } else {
            TabView {
                ForEach(tips) { tip in
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 20) {
                                HStack {
                                    Image("mitosImage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: widthScreen * 0.8, height: heightScreen * 0.22)
                                        .padding(5)
                                }
                                .frame(width: widthScreen * 0.85, height: heightScreen * 0.24)
                                .background(LinearGradient(gradient: Gradient(colors: [Color("LightBlueColor"), Color("BlueColor")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                
                                VStack {
                                    Text(tip.tip)
                                        .font(.system(size: 14))
                                }
                            }
                            .padding(15)
                        }
                        
                        Spacer()
                    }
                    .frame(width: widthScreen * 0.9, height: heightScreen * 0.5)
                    .background(Color.gray.opacity(0.5))
                }
            }
        }
    }
}

struct TipsTabView_Previews: PreviewProvider {
    static let tips: [Tip] = Bundle.main.decode("Tips.json")
    
    static var previews: some View {
        TipsTabView(index: .constant(1), tips: tips)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
