//
//  AppBarShape.swift
//  CeroCaries
//
//  Created by Alex Barreto on 28/11/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import Foundation
import SwiftUI

//struct AppBarShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        Path { path in
//            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
//            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
//        }
//    }
//}

struct AppBarArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY), control: CGPoint(x: rect.midX, y: rect.midY))
        }
    }
}

struct AppBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY), control: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}
