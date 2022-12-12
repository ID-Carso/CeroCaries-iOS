//
//  Pregunta.swift
//  CeroCaries
//
//  Created by Alex Barreto on 06/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

struct Pregunta: Codable, Identifiable {
    let id: Int
    let pregunta: String
    let info_type: Int
    let description: String
}
