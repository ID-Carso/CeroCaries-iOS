//
//  TipoCariogenico.swift
//  CeroCaries
//
//  Created by Alex Barreto on 12/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

struct Cariogenico: Codable, Identifiable {
    let id: Int
    let tipo: String
    let descripcion: String
    let bgColor: String
    let info: [Alimento]
}

struct Alimento: Codable, Identifiable {
    let id: Int
    let categoria: String
    let alimentos: String
}
