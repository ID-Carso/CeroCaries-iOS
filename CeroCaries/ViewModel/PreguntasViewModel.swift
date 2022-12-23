//
//  PreguntasViewModel.swift
//  CeroCaries
//
//  Created by Alex Barreto on 15/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import Foundation

class PreguntasViewModel: ObservableObject {
    @Published var cuidadosGenerales: [Int]
    @Published var cuidadosLocales: [Int]
    @Published var totalAfirmativas: Int = 0
    @Published var riesgo: String = ""
    @Published var average: Int = 0
    @Published var averageColor: String = ""
    
    var lowRiskCount: Int = 0
    var mediumRiskCount: Int = 0
    var highRiskCount: Int = 0
    
    init(generales: Int, locales: Int) {
        self.cuidadosGenerales = Array(repeating: 0, count: generales)
        self.cuidadosLocales = Array(repeating: 0, count: locales)
        if (self.cuidadosGenerales.count + self.cuidadosLocales.count) == 28 {
            self.lowRiskCount = 9
            self.mediumRiskCount = 19
            self.highRiskCount = 28
        } else {
            self.lowRiskCount = 10
            self.mediumRiskCount = 20
            self.highRiskCount = 30
        }
    }
    
    func calculateRisks() {
        totalAfirmativas = countPositiveAnswers(arr: cuidadosGenerales) + countPositiveAnswers(arr: cuidadosLocales)
        
        if cuidadosLocales[0] == 2 && cuidadosLocales[1] == 2 {
            riesgo = "Alto"
            average = 90
            averageColor = "RedColor"
        } else {
            if countRedRisks() < 4 {
                switch totalAfirmativas {
                case 0...lowRiskCount:
                    riesgo = "Bajo"
                    average = 33
                    averageColor = "ChartGreenColor"
                case 11...mediumRiskCount:
                    riesgo = "Moderado"
                    average = 60
                    averageColor = "tratamientoColor"
                case 21...highRiskCount:
                    riesgo = "Alto"
                    average = 90
                    averageColor = "RedColor"
                default:
                    break
                }
            } else {
                riesgo = "Alto"
                average = 90
                averageColor = "RedColor"
            }
        }
    }
    
    func countRedRisks() -> Int {
        var countRed = 0
        for i in 0..<cuidadosGenerales.count {
            switch i {
            case 0..<4, 7...8:
                if cuidadosGenerales[i] == 2 {
                    countRed += 1
                }
            default:
                break
            }
        }
        for i in 0..<5 {
            if cuidadosLocales[i] == 2 {
                countRed += 1
            }
        }
        
        return countRed
    }
    
    func countPositiveAnswers(arr: [Int]) -> Int {
        var counter = 0
        for i in 0..<arr.count {
            if arr[i] == 2 {
                counter += 1
            }
        }
        
        return counter
    }
    
    func checkAnswersGenerales() -> Bool {
        for i in cuidadosGenerales {
            if i == 0 {
                return false
            }
        }
        
        return true
    }
    
    func checkAnswersLocales() -> Bool {
        for i in cuidadosLocales {
            if i == 0 {
                return false
            }
        }
        
        return true
    }
}
