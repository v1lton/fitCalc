//
//  TrainingSheet.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos on 11/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import Foundation

let dictionaryExercises = ["Agachamento Smith": 2.0, "Crucifixo Reto": 2.8, "Flexão Básica": 3.0, "Paralelas": 3.8, "Supino Reto": 2.6, "Supino Inclinado": 2.8]

class TrainingSheet {
    var arrayExercise: [Exercise] = []
    
    func totalTime() -> Int {
        var resultInSeconds: Double = 0
        for exercise in arrayExercise {
            let weightOfExercise = dictionaryExercises[exercise.exercise]
            resultInSeconds = resultInSeconds + (weightOfExercise! * Double(exercise.rep) * Double(exercise.serie))
        }
        var resultInMinutes = convertSecondstoMinutes(valueInSecods: resultInSeconds)
        resultInMinutes += restTime()
        return resultInMinutes
    }
    
    func convertSecondstoMinutes(valueInSecods: Double) -> Int {
        return Int(valueInSecods / 60)
    }

    //Considerando 1min de descanso entre exercícios
    func restTime() -> Int {
        var restTime: Int = 0
        for serie in arrayExercise {
            restTime = restTime + serie.serie
        }
        return restTime
    }
}
