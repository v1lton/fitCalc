//
//  ViewController.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos  on 02/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

let dictionaryExercises = ["Agachamento Smith": 2.0, "Crucifixo Reto": 2.8, "Flexão Básica": 3.0, "Paralelas": 3.8, "Supino Reto": 2.6, "Supino Inclinado": 2.8]

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //****Attributes****
    let arrayExercisesToPickerView = ["Agachamento Smith", "Crucifixo Reto", "Flexão Básica", "Paralelas", "Supino Reto", "Supino Inclinado"]
    var pickerView = UIPickerView()
    var tableView = UITableView()
    var trainingSheet = TrainingSheet()
    
    //****IBs****
    //Labels
    @IBOutlet var finalResult: UILabel!
    
    //Buttons
    @IBAction func buttonCalcule() {
        let result = Int(trainingSheet.totalTime())
        let resultInMinutes = result/60
        showResult(result: resultInMinutes)
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
