//
//  TrainingSheetTableViewCell.swift
//  primeiroLicativo
//
//  Created by Wilton Ramos on 11/03/20.
//  Copyright © 2020 Wilton Ramos . All rights reserved.
//

import UIKit

class TrainingSheetTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var exerciseField: UILabel!
    @IBOutlet weak var repetionField: UILabel!
    @IBOutlet weak var serieField: UILabel!
    var exercise = Exercise()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        exerciseField.placeholder = "Selecionar Exercício"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
