//
//  CuidadoDental.swift
//  CeroCaries
//
//  Created by Alex Barreto on 13/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

struct CuidadoDental: Codable, Identifiable {
    let id: Int
    let tratamiento: String
    let bajo: String
    let medio: String
    let alto: String
}
