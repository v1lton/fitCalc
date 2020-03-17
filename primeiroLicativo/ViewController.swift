//
//  ViewController.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos  on 02/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

let dictionaryExercises = ["Agachamento Smith": 2.0, "Crucifixo Reto": 2.8, "Flexão Básica": 3.0, "Paralelas": 3.8, "Supino Reto": 2.6, "Supino Inclinado": 2.8]

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //****Attributes****
    let arrayExercisesToPickerView = ["Agachamento Smith", "Crucifixo Reto", "Flexão Básica", "Paralelas", "Supino Reto", "Supino Inclinado"]
    var pickerView = UIPickerView()
    var tableView = UITableView()
    var trainingSheet = TrainingSheet()
    var arrayExercises: [Exercise] = []
    
    
    //****IBs****
    //Labels
    @IBOutlet var finalResult: UILabel!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var exerciseField: UITextField!
    @IBOutlet weak var repetitionField: UITextField!
    @IBOutlet weak var serieField: UITextField!
    
    //Buttons
    @IBAction func buttonCalcule() {
        let result = Int(trainingSheet.totalTime())
        let resultInMinutes = result/60
        showResult(result: resultInMinutes)
    }
    @IBAction func addButton() {
        blurView.isHidden = false
        popUpView.isHidden = false
        blurView.alpha = 0.5
        popUpView.alpha = 1
    }
    @IBAction func confirmButton() {
        var exerciseTemporary: Exercise = Exercise()
        exerciseTemporary.exercise = exerciseField.text!
        exerciseTemporary.rep = Int(repetitionField.text!)!
        exerciseTemporary.serie = Int(serieField.text!)!
        arrayExercises.append(exerciseTemporary)
        tableView.reloadData()
        cancelButton()
    }
    @IBAction func cancelButton() {
        blurView.isHidden = true
        popUpView.isHidden = true
    }
    
    //****Functions****
    //Swift Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Esconde o teclado ao tocar na tela
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        //PickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        g
        blurView.isHidden = true
        popUpView.isHidden = true
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
        
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //+1 n sei o pq
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingSheetTableViewCell") as! TrainingSheetTableViewCell
        return cell
    }
    
    //My Functions
    func showResult(result: Int) {
        //Abre um popup que apresenta um texto com o valor de setSum()
        let finalText = "O tempo médio será de: \(result) minutos" // Interpolação bonitinha
        finalResult.text = finalText
    }
}
