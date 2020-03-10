//
//  ViewController.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos  on 02/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

let dictionaryExercises = ["Agachamento Smith": 2.0, "Crucifixo Reto": 2.8, "Flexão Básica": 3.0, "Paralelas": 3.8, "Supino Reto": 2.6, "Supino Inclinado": 2.8]

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //****Attributes****
    let arrayExercisesToPickerView = ["Agachamento Smith", "Crucifixo Reto", "Flexão Básica", "Paralelas", "Supino Reto", "Supino Inclinado"]
    var pickerView = UIPickerView()
    var arrayExercises = ["", "", "", ""]
    
    //****IBs****
    //Exercises Fields
    @IBOutlet var excOne: UITextField!
    @IBOutlet var excTwo: UITextField!
    @IBOutlet var excThree: UITextField!
    @IBOutlet var excFour: UITextField!
    
    //Repetions Fields
    @IBOutlet var repOne: UITextField!
    @IBOutlet var repTwo: UITextField!
    @IBOutlet var repThree: UITextField!
    @IBOutlet var repFour: UITextField!
    
    //Series Fields
    @IBOutlet var serOne: UITextField!
    @IBOutlet var serTwo: UITextField!
    @IBOutlet var serThree: UITextField!
    @IBOutlet var serFour: UITextField!
    
    //Labels
    @IBOutlet var finalResult: UILabel!
    
    //Buttons
    @IBAction func buttonCalcule() {
        let arrayRep = getRep()
        let arraySer = getSer()
        let ficha = Ficha(Exercises: arrayExercises, Series: arraySer, Rep: arrayRep)
        let result = Int(ficha.totalTime())
        let resultInMinutes = result/60
        showResult(result: resultInMinutes)
    }
    
    //****Functions****
    
    //Swift Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        //PickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        //excOne
        excOne.inputView = pickerView
        excOne.textAlignment = .center
        excOne.placeholder = "Selecionar Exercício"
        //excTwo
        excTwo.inputView = pickerView
        excTwo.textAlignment = .center
        excTwo.placeholder = "Selecionar Exercício"
        //excThree
        excThree.inputView = pickerView
        excThree.textAlignment = .center
        excThree.placeholder = "Selecionar Exercício"
        //excFour
        excFour.inputView = pickerView
        excFour.textAlignment = .center
        excFour.placeholder = "Selecionar Exercício"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayExercisesToPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayExercisesToPickerView[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if excOne.isEditing {
            excOne.text = arrayExercisesToPickerView[row]
            excOne.resignFirstResponder()
            arrayExercises[0] = excOne.text!
        } else if excTwo.isEditing {
            excTwo.text = arrayExercisesToPickerView[row]
            excTwo.resignFirstResponder()
            arrayExercises[1] = excTwo.text!
        } else if excThree.isEditing {
            excThree.text = arrayExercisesToPickerView[row]
            excThree.resignFirstResponder()
            arrayExercises[2] = excThree.text!
        } else {
            excFour.text = arrayExercisesToPickerView[row]
            excFour.resignFirstResponder()
            arrayExercises[3] = excFour.text!
        }
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    //My Functions
    func getRep() -> [Int] {
        //Pega os dados de Repetições
        var arrayRep = [Int]()
        arrayRep.append(Int(repOne.text!)!) // a exclamação faz com que seja atribuído algo à variável
        arrayRep.append(Int(repTwo.text!)!)
        arrayRep.append(Int(repThree.text!)!)
        arrayRep.append(Int(repThree.text!)!)
        return arrayRep
    }
    
    func getSer() -> [Int] {
        //Pega os dados de Séries
        var arraySer = [Int]()
        arraySer.append(Int(serOne.text!)!)
        arraySer.append(Int(serTwo.text!)!)
        arraySer.append(Int(serThree.text!)!)
        arraySer.append(Int(serFour.text!)!)
        return arraySer
    }
    
    func setSum() {
        //Soma os valores de getInputs()
    }
    
    func blurApp() {
        //Borra a tela
    }
    
    func showResult(result: Int) {
        //Abre um popup que apresenta um texto com o valor de setSum()
        let finalText = "O tempo médio será de: \(result) minutos" // Interpolação bonitinha
        finalResult.text = finalText
    }
}
