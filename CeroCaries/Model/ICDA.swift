//
//  ICDA.swift
//  CeroCaries
//
//  Created by Alex Barreto on 22/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

struct ICDA: Codable, Identifiable {
    let id: Int
    let tabTitle: String
    let info: [ICDAInfo]
}

struct ICDAInfo: Codable, Identifiable {
    let id: Int
    let arrow: String
    let type: String
    let image: [String]
}
