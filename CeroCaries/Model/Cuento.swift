//
//  Cuento.swift
//  CeroCaries
//
//  Created by Alex Barreto on 21/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

struct Cuento: Codable, Identifiable {
    let id: Int
    let titulo: String
    let imagenes: [String]
    let primaryColor: String
    let secondaryColor: String
}
