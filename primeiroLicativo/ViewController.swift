//
//  ViewController.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos  on 02/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //****Attributes****
    let arrayExercises = ["Supino Reto", "Supino Inclinado", "Flexão Básica", "Paralelas", "Crucifixo Reto"]
    var pickerView = UIPickerView()
    
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
        let result = multiplication(arrayRep: arrayRep, arraySer:arraySer)
        showResult(result: result)
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
        return arrayExercises.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayExercises[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if excOne.isEditing {
            excOne.text = arrayExercises[row]
            excOne.resignFirstResponder()
        } else if excTwo.isEditing {
            excTwo.text = arrayExercises[row]
            excTwo.resignFirstResponder()
        } else if excThree.isEditing {
            excThree.text = arrayExercises[row]
            excThree.resignFirstResponder()
        } else {
            excFour.text = arrayExercises[row]
            excFour.resignFirstResponder()
        }
        pickerView.selectRow(0, inComponent: 0, animated: false)
    }
    
    //My Functions
    func getDate(){
        //Pegar a data do picker
    }
    
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
    
    func multiplication(arrayRep: [Int], arraySer: [Int]) -> Int {
        var result = 0
        for i in 0...3 {
            result = result + (arrayRep[i] * arraySer[i])
        }
        return result
    }
    
    func setSum() {
        //Soma os valores de getInputs()
    }
    
    func blurApp() {
        //Borra a tela
    }
    
    func showResult(result: Int) {
        //Abre um popup que apresenta um texto com o valor de setSum()
        let finalText = "O tempo médio será de: " + String(result) + " minutos"
        finalResult.text = finalText
    }
    
}

