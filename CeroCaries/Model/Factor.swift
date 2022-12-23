//
//  Factor.swift
//  CeroCaries
//
//  Created by Alex Barreto on 06/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import Foundation

struct FactorRiesgo: Codable, Identifiable {
    let id: Int
    let nombre: String
    let titulo: String
    let tip: String
    let factores_generales: [Pregunta]
    let factores_locales: [Pregunta]
    let bibliografia: [String]
    let factores_texto: String
    let definicion: String
    let cariogenicos: [Cariogenico]
    let cuidados_dentales: [CuidadoDental]
    let cuidados_profesionales: [CuidadoDental]
}
