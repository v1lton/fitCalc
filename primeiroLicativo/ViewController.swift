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
    
    //****IBs****
    //Buttons
    @IBAction func addButton() {
        insertNewCellInTableView()
    }
    
    @IBAction func okButton() {
        resultView.isHidden = true
        fadeView.isHidden = true
    }
    
    @IBAction func buttonCalcule() {
        appendExercisesToTrainingSheet()
        var result = 0
        result = trainingSheet.totalTime()
        showResult(result: result)
    }
    
    //Labels
    @IBOutlet var finalResult: UILabel!
    
    //TableViews
    @IBOutlet weak var tableView: UITableView!
    
    //Views
    @IBOutlet var resultView: UIView!
    @IBOutlet var fadeView: UIView!
    
    //****Functions****
    //Swift Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //Esconde o teclado ao tocar na tela
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        //View
        resultView.isHidden = true
        fadeView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countForTableview
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingSheetTableViewCell", for: indexPath) as! TrainingSheetTableViewCell
        return cell
    }
    
    //My Functions
    func insertNewCellInTableView() {
        appendExercisesToTrainingSheet()
        let indexPath = IndexPath(row:countForTableview, section: 0)
        countForTableview += 1
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .bottom)
        tableView.endUpdates()
        tableView.reloadData()
    }
    
    func appendExercisesToTrainingSheet() {
        let indexPath = IndexPath(row:(countForTableview - 1) , section: 0)
        let cell:TrainingSheetTableViewCell = tableView.cellForRow(at: indexPath)as! TrainingSheetTableViewCell
        getExerciseFromTableViewCell(TrainingSheetcell: cell)
        trainingSheet.arrayExercise.append(cell.exercise)
    }
    
    func getExerciseFromTableViewCell(TrainingSheetcell cell: TrainingSheetTableViewCell) {
        cell.exercise.exercise = cell.exerciseField.text!
        cell.exercise.rep = Int(cell.repetitionField.text!)!
        cell.exercise.serie = Int(cell.serieField.text!)!
    }
    
    func showResult(result: Int) {
        //Abre um popup que apresenta um texto com o valor de setSum()
        fadeView.isHidden = false
        fadeView.alpha = 0.4
        resultView.isHidden = false
        let finalText = String(result)
        finalResult.text = finalText
    }
}
