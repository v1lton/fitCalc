//
//  TrainingSheetTableViewCell.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos on 11/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

class TrainingSheetTableViewCell: UITableViewCell, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //****Atributes****
    let arrayExercisesToPickerView = ["Agachamento Smith", "Crucifixo Reto", "Flexão Básica", "Paralelas", "Supino Reto", "Supino Inclinado"]
    let exercise: Exercise = Exercise()
    
    //MARK: Properties
    @IBOutlet var exerciseField: UITextField!
    @IBOutlet var repetitionField: UITextField!
    @IBOutlet var serieField: UITextField!
    var pickerView = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        exerciseField.placeholder = "Selecionar Exercício"
        exerciseField.textAlignment = .center
        exerciseField.inputView = pickerView
        exerciseField.delegate = self
        repetitionField.delegate = self
        serieField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
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
        exerciseField.text = arrayExercisesToPickerView[row]
        exerciseField.resignFirstResponder()
    }
}
