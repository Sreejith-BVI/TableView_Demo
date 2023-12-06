//
//  FormTableViewCell.swift
//  tableViewTask1
//
//  Created by Sreejith Warrier on 02/08/23.
//

import UIKit


class FormTableViewCell: UITableViewCell {
    //MARK: IBoutLets
    @IBOutlet weak var contentlbl:UILabel!
    @IBOutlet weak var userInputTFT:UITextField!
    
   //MARK: Variables
//    var userData: ((String,Int) -> ())?
    var data: ((String,String) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        userInputTFT.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

//MARK: TextFieldDelegate Method
extension FormTableViewCell:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let label = contentlbl.text{
             let text = (textField.text as? NSString)?.replacingCharacters(in: range, with: string) ?? ""
            data?(label,text)
            print("hello")
        }
        return true
    }
}
