//
//  ViewController.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos  on 02/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //****Attributes****
    var pickerView = UIPickerView()
    var trainingSheet = TrainingSheet()
    var countForTableview = 1
    let datePicker = UIDatePicker()
    
    //****IBs****
    //Buttons
    @IBAction func okButton() {
        resultView.isHidden = true
        fadeView.isHidden = true
    }
    
    @IBAction func buttonCalcule() {
        appendExercisesToTrainingSheet()
        let result = trainingSheet.totalTime()
        showResult(result: result)
    }
    
    @IBAction func addButton() {
        insertNewCellInTableView()
    }
    
    //Labels
    @IBOutlet var finalResult: UILabel!
    
    //TableViews
    @IBOutlet weak var tableView: UITableView!
    
    //TextFields
    @IBOutlet weak var dateField: UITextField!
    
    //Views
    @IBOutlet var resultView: UIView!
    @IBOutlet var fadeView: UIView!
    
    //****Functions****
    //Swift Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        hideKeyboard()
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        //View
        resultView.isHidden = true
        fadeView.isHidden = true
        //DatePicker
        createDatePicker()
        dateField.textAlignment = .center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countForTableview
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingSheetTableViewCell", for: indexPath) as! TrainingSheetTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    //My Functions
    func appendExercisesToTrainingSheet() {
        let indexPath = IndexPath(row:(countForTableview - 1) , section: 0)
        let cell:TrainingSheetTableViewCell = tableView.cellForRow(at: indexPath)as! TrainingSheetTableViewCell
        getExerciseFromTableViewCell(TrainingSheetcell: cell)
        trainingSheet.arrayExercise.append(cell.exercise)
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        dateField.inputAccessoryView = toolbar
        dateField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let dateString = formatter.string(from: datePicker.date)
        dateField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    func getExerciseFromTableViewCell(TrainingSheetcell cell: TrainingSheetTableViewCell) {
        cell.exercise.exercise = cell.exerciseField.text!
        cell.exercise.rep = Int(cell.repetitionField.text!)!
        cell.exercise.serie = Int(cell.serieField.text!)!
    }
    
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func insertNewCellInTableView() {
        appendExercisesToTrainingSheet()
        let indexPath = IndexPath(row:countForTableview, section: 0)
        countForTableview += 1
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .bottom)
        tableView.endUpdates()
        tableView.reloadData()
    }
    
    func showResult(result: Int) {
        fadeView.isHidden = false
        fadeView.alpha = 0.4
        resultView.isHidden = false
        let finalText = String(result)
        finalResult.text = finalText
    }
    
    
}
