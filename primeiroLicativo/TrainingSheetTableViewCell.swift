//
//  TrainingSheetTableViewCell.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos on 11/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

class TrainingSheetTableViewCell: UITableViewCell, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var exerciseField: UITextField!
    @IBOutlet weak var repetionField: UITextField!
    @IBOutlet weak var serieField: UITextField!
    var exercise = Exercise()
    var pickerView = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        exerciseField.placeholder = "Selecionar Exercício"
        pickerView.delegate = self
        pickerView.datasource = self
        
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
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }

}
