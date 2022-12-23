//
//  AppFonts.swift
//  CeroCaries
//
//  Created by Alex Barreto on 21/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import Foundation
import SwiftUI

struct AppFonts {
    static let buttonTextBold: UIFont = {
        let font = UIFont(name: "Gallant bold", size: 18.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let categoryButtonTextBold: UIFont = {
        let font = UIFont(name: "Gallant bold", size: 24.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let secondaryActionButtonText: UIFont = {
        let font = UIFont(name: "Gallant regular", size: 16.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let headerSectionTitle: UIFont = {
        let font = UIFont(name: "Gallant bold", size: 20.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .title1)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let textItalic: UIFont = {
        let font = UIFont(name: "Gallant regular-italic", size: 16.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let regularText: UIFont = {
        let font = UIFont(name: "Gallant regular", size: 16.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let regularBoldText: UIFont = {
        let font = UIFont(name: "Gallant bold", size: 16.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let menuSectionText: UIFont = {
        let font = UIFont(name: "Gallant bold", size: 20.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let blackTitle: UIFont = {
        let font = UIFont(name: "Gallant black", size: 20.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let blackResult: UIFont = {
        let font = UIFont(name: "Gallant black", size: 30.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let percentText: UIFont = {
        let font = UIFont(name: "Gallant black", size: 24.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
    
    static let tabText: UIFont = {
        let font = UIFont(name: "Gallant bold", size: 12.0)!
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return fontMetrics.scaledFont(for: font)
    }()
}
