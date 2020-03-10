//
//  Ficha.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos on 10/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import Foundation

class Ficha {
    var arrayExercise: [String]
    var arraySerie: [Int]
    var arrayRep: [Int]
    
    init(Exercises arrayExercise: [String], Series arraySerie: [Int], Rep arrayRep: [Int]) {
        self.arrayExercise = arrayExercise
        self.arraySerie = arraySerie
        self.arrayRep = arrayRep
    }
    
    func totalTime() -> Double {
        var result: Double = 0
        
        for i in 0...3 {
            let actualExercise: String = arrayExercise[i]
            let arrayRepDouble: Double = Double(arrayRep[i])
            let arraySerieDouble: Double = Double(arraySerie[i])
            result = result + dictionaryExercises[actualExercise]! * arrayRepDouble * arraySerieDouble
        }
        
        result = result + Double(restTime())
        return result
    }
    
    func restTime() -> Int {
        var resultInMinutes: Int = 0
        
        for i in 0...3 {
            resultInMinutes = resultInMinutes + arraySerie[i]
        }
        
        let resultInSeconds = resultInMinutes * 60
        return resultInSeconds
    }
}
