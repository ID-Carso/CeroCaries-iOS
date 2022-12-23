//
//  CuentoView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 21/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CuentoView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool = false
    @State var showReinoGolosinas: Bool = false
    @State var showBatallaSucia: Bool = false
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State var isShowingSlide: Bool = false
    @State var countdown = 15
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let cuento: Cuento
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { proxy in
                
                let width = proxy.size.width
                
                HStack(spacing: 0) {
                    ForEach(cuento.imagenes, id: \.self) { image in
                        CuentoImageItemView(image: image)
                    }
                }
                .offset(x: (CGFloat(currentIndex) * -width) + offset)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { value, out, _ in
                            out = value.translation.width
                        })
                        .onEnded { value in
                            countdown = 15
                            isShowingSlide = false
                            let offsetX = value.translation.width
                            let progress = -offsetX / width
                            let roundedIndex = progress.rounded()
                            currentIndex += Int(roundedIndex)
                            if currentIndex >= cuento.imagenes.count {
                                currentIndex = cuento.imagenes.count - 1
                            } else if currentIndex < 0 {
                                currentIndex = 0
                            }
                        }
                )
            }
            .animation(.easeInOut, value: offset == 0)
            
            VStack(spacing: 0) {
                AppBarView(showMenu: $showMenu)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .background(Color("LightBlueColor"))
                            .clipShape(Circle())
                            .shadow(color: Color.gray, radius: 5, x: 2, y: 2)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                }
                
                Spacer(minLength: heightScreen * 0.5)
                
                HStack(spacing: 10) {
                    Text("Desliza para ver la historia")
                        .font(Font(AppFonts.regularText))
                        .foregroundColor(cuento.primaryColor == "white" ? Color.blue : Color.white)
                    
                    Image(cuento.primaryColor == "white" ? "handslide" : "whitehandslide")
                        .resizable()
                        .scaledToFit()
                        .frame(width: heightScreen * 0.05, height: heightScreen * 0.05)
                }
                .frame(width: widthScreen * 0.8, height: heightScreen * 0.06)
                .background(cuento.primaryColor == "white" ? Color.white : Color.purple)
                .clipShape(
                    Capsule()
                )
                .opacity(isShowingSlide ? 1.0 : 0.0)
                .animation(.easeOut(duration: 0.5), value: isShowingSlide)
                .onTapGesture {
                    isShowingSlide = false
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                }
                
                Spacer()
                
                FooterLineView()
            }
            .frame(width: widthScreen)
            .onTapGesture {
                showMenu = false
            }
            .overlay(
                Rectangle()
                    .fill(
                        Color.primary.opacity(showMenu ? 0.1 : 0.0)
                    )
                    .onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                }
            )
            
            MenuView(showMenu: $showMenu)
        }
        .background(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .onAppear {
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            isShowingSlide = true
        }
        .onReceive(timer) { time in
            print("Countdown: \(countdown)");
            if countdown > 0 {
                countdown -= 1
            }
            if countdown <= 0 {
                isShowingSlide = true
            }
        }
        .onDisappear {
            showMenu = false
        }
    }
}

struct CuentoView_Previews: PreviewProvider {
    static let cuentos: [Cuento] = Bundle.main.decode("cuentos.json")
    
    static var previews: some View {
        CuentoView(cuento: cuentos[0])
    }
}
