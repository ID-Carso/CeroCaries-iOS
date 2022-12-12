//
//  Tip.swift
//  CeroCaries
//
//  Created by Alex Barreto on 05/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import Foundation

struct Tip: Codable, Identifiable {
    let id: Int
    let nombre: String
    let titulo: String
    let tip: String
}
