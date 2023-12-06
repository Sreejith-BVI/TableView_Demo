//
//  CustomButtonTableViewCell.swift
//  tableViewTask1
//
//  Created by Sreejith Warrier on 02/08/23.
//

import UIKit

class CustomButtonTableViewCell: UITableViewCell {
    //MARK: IBOutLet
    @IBOutlet weak var submitBtn:UIButton!
    
   //MARK: LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
