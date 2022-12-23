//
//  QuestionView.swift
//  CeroCaries
//
//  Created by Alex Barreto on 15/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    
    @Binding var showCariogenicos: Bool
    @Binding var descriptionAlert: String
    @Binding var showAlert: Bool
    @Binding var showICDAS: Bool
    @State var selectedButton: Int = 0
    let pregunta: Pregunta
    var yesAction: (() -> Void)
    var noAction: (() -> Void)
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("\(pregunta.id)")
                    .font(Font(AppFonts.regularBoldText))
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .background(Color("LightBlueColor"))
                    .clipShape(Circle())
                
                Text(pregunta.pregunta)
                    .font(Font(AppFonts.regularText))
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            
            if pregunta.info_type > 0 {
                Button(action: {
                    switch pregunta.info_type {
                    case 1:
                        showCariogenicos = true
                    case 2:
                        descriptionAlert = pregunta.description
                        showAlert = true
                    case 3:
                        showICDAS = true
                    default:
                        break
                    }
                }) {
                    Text("leer más")
                        .font(Font(AppFonts.regularText))
                        .foregroundColor(.white)
                        .frame(width: widthScreen * 0.25, height: heightScreen * 0.03)
                        .background(Color("OrangeButtonColor"))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                }
            }
            
            HStack(spacing: 40) {
                Button(action: {
                    yesAction()
                    selectedButton = 2
                }) {
                    if selectedButton == 2 {
                        Text("Sí")
                            .font(Font(AppFonts.regularBoldText))
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.black)
                            .cornerRadius(15)
                    } else {
                        Text("Sí")
                            .font(Font(AppFonts.regularBoldText))
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2)
                            )
                    }
                }
                
                Button(action: {
                    noAction()
                    selectedButton = 1
                }) {
                    if selectedButton == 1 {
                        Text("No")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.black)
                            .cornerRadius(15)
                    } else {
                        Text("No")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2)
                            )
                    }
                }
            }
            .padding(.vertical, 20)
            
            SeparatorView()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static let factores: [FactorRiesgo] = Bundle.main.decode("factores_riesgo.json")
    
    static var previews: some View {
        QuestionView(showCariogenicos: .constant(false), descriptionAlert: .constant(""), showAlert: .constant(false), showICDAS: .constant(true), pregunta: factores[0].factores_generales[0], yesAction: {}, noAction: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
