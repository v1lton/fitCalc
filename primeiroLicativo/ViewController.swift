//
//  ViewController.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos  on 02/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Repetions fields
    @IBOutlet var repOne: UITextField!
    @IBOutlet var repTwo: UITextField!
    @IBOutlet var repThree: UITextField!
    @IBOutlet var repFour: UITextField!
    
    //Series fields
    @IBOutlet var serOne: UITextField!
    @IBOutlet var serTwo: UITextField!
    @IBOutlet var serThree: UITextField!
    @IBOutlet var serFour: UITextField!
    
    //Label
    @IBOutlet var finalResult: UILabel!
    
    
    @IBAction func buttonCalcule() {
        var arrayRep = getRep()
        var arraySer = getSer()
        var result = multiplication(arrayRep: arrayRep, arraySer:arraySer)
        showResult(result: result)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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
        finalResult.text = finalResult.text! + String(result) + " minutos"
    }
    
}

