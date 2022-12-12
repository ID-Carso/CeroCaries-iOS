//
//  CustomAlert.swift
//  CeroCaries
//
//  Created by Alex Barreto on 07/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

struct CustomAlert: View {

    // MARK: - Value
    // MARK: Public
    let title: String
    let message: String
    let dismissButton: CustomAlertButton?
    let primaryButton: CustomAlertButton?
    let secondaryButton: CustomAlertButton?

    // MARK: Private
    @State private var opacity: CGFloat           = 0
    @State private var backgroundOpacity: CGFloat = 0
    @State private var scale: CGFloat             = 0.001

//    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    // MARK: - View
    // MARK: Public
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                dimView

                alertView
                    .scaleEffect(scale)
                    .opacity(opacity)
            }
            .ignoresSafeArea()
            .transition(.opacity)
            .task {
                animate(isShown: true)
            }
        } else {
            ZStack {
                dimView

                alertView
                    .scaleEffect(scale)
                    .opacity(opacity)
            }
            .transition(.opacity)
            .onAppear {
                animate(isShown: true)
            }
        }
    }

    // MARK: Private
    private var alertView: some View {
        VStack(spacing: 20) {
            titleView
            messageView
            buttonsView
        }
        .padding(24)
        .frame(width: 320)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 12)
    }

    @ViewBuilder
    private var titleView: some View {
        if !title.isEmpty {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .lineSpacing(24 - UIFont.systemFont(ofSize: 18, weight: .bold).lineHeight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private var messageView: some View {
        if !message.isEmpty {
            Text(message)
                .font(.system(size: title.isEmpty ? 18 : 16))
                .foregroundColor(title.isEmpty ? .black : .gray)
                .lineSpacing(24 - UIFont.systemFont(ofSize: title.isEmpty ? 18 : 16).lineHeight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var buttonsView: some View {
        HStack(spacing: 12) {
            if dismissButton != nil {
                dismissButtonView

            } else if primaryButton != nil, secondaryButton != nil {
                secondaryButtonView
                primaryButtonView
            }
        }
        .padding(.top, 23)
    }

    @ViewBuilder
    private var primaryButtonView: some View {
        if let button = primaryButton {
            CustomAlertButton(title: button.title) {
                animate(isShown: false) {
                    self.mode.wrappedValue.dismiss()
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    @ViewBuilder
    private var secondaryButtonView: some View {
        if let button = secondaryButton {
            CustomAlertButton(title: button.title) {
                animate(isShown: false) {
                    self.mode.wrappedValue.dismiss()
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    @ViewBuilder
    private var dismissButtonView: some View {
        if let button = dismissButton {
            CustomAlertButton(title: button.title) {
                animate(isShown: false) {
                    self.mode.wrappedValue.dismiss()
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    private var dimView: some View {
        Color.gray
            .opacity(0.88)
            .opacity(backgroundOpacity)
    }


    // MARK: - Function
    // MARK: Private
    private func animate(isShown: Bool, completion: (() -> Void)? = nil) {
        switch isShown {
        case true:
            opacity = 1

            withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0).delay(0.5)) {
                backgroundOpacity = 1
                scale             = 1
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                completion?()
            }

        case false:
            withAnimation(.easeOut(duration: 0.2)) {
                backgroundOpacity = 0
                opacity           = 0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion?()
            }
        }
    }
    
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//    @State private var backgroundOpacity: CGFloat = 0
//    @State private var opacity: CGFloat           = 0
//    @State private var scale: CGFloat             = 0.001
//
//    let message: String
//    let title: String
//
//    var body: some View {
//        if #available(iOS 14.0, *) {
//            ZStack {
//                Color.gray
//                    .opacity(0.88)
//                    .opacity(backgroundOpacity)
//
//                VStack {
//
//                    Text(message)
//                        .font(.system(size: title.isEmpty ? 18 : 16))
//                        .foregroundColor(title.isEmpty ? .black : .gray)
//                        .lineSpacing(24 - UIFont.systemFont(ofSize: title.isEmpty ? 18 : 16).lineHeight)
//                        .multilineTextAlignment(.leading)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                }
//                .padding(.vertical)
//                .background(Color.white)
//                .cornerRadius(12)
//                .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 12)
//            }
//            .ignoresSafeArea()
//            .transition(.opacity)
//        } else {
//            ZStack {
//                Color.gray
//                    .opacity(0.88)
//                    .opacity(backgroundOpacity)
//
//                VStack {
//
//                    if !title.isEmpty {
//                        Text(title)
//                            .font(.system(size: 18, weight: .bold))
//                            .foregroundColor(.black)
//                            .lineSpacing(24 - UIFont.systemFont(ofSize: 18, weight: .bold).lineHeight)
//                            .multilineTextAlignment(.leading)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//
//                    Text(message)
//                        .font(.system(size: title.isEmpty ? 18 : 16))
//                        .foregroundColor(title.isEmpty ? .black : .gray)
//                        .lineSpacing(24 - UIFont.systemFont(ofSize: title.isEmpty ? 18 : 16).lineHeight)
//                        .multilineTextAlignment(.leading)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                    CustomAlertButton(title: "Cerrar") {
//                        animate(isShown: false) {
//                            self.mode.wrappedValue.dismiss()
//                        }
//
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
//                            button.action?()
//                        }
//                    }
//                }
//                .padding(24)
//                .frame(width: 320)
//                .background(Color.white)
//                .cornerRadius(12)
//                .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 12)
//            }
//            .transition(.opacity)
//            .onAppear {
//
//            }
//        }
//    }
//
//    private func animate(isShown: Bool, completion: (() -> Void)? = nil) {
//        switch isShown {
//            case true:
//                opacity = 1
//
//                withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0).delay(0.5)) {
//                    backgroundOpacity = 1
//                    scale             = 1
//                }
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    completion?()
//                }
//
//            case false:
//                withAnimation(.easeOut(duration: 0.2)) {
//                    backgroundOpacity = 0
//                    opacity           = 0
//                }
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                    completion?()
//                }
//        }
//    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(title: "", message: "Hola mundo", dismissButton: CustomAlertButton(title: "Cerrar"), primaryButton: nil, secondaryButton: nil)
    }
}
