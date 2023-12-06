//
//  SecondViewController.swift
//  tableViewTask1
//
//  Created by Sreejith Warrier on 02/08/23.
//

import UIKit

class SecondViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var myTableView:UITableView!
    //MARK: Variables
  
    var userData:[String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
}
//MARK: TableViewDelegate Methods
extension SecondViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as! labelTableViewCell
        
        let keyValue = Array(userData.keys)[indexPath.row]
      
        switch CellContentType.allCases[indexPath.row]{
        case .firstName:
            cell.contentTypeLabel.text = keyValue
            cell.displayLabel.text = userData[keyValue]
            return cell
        case .lastName:
            cell.contentTypeLabel.text = keyValue
            cell.displayLabel.text = userData[keyValue]
            return cell
        case .address:
            cell.contentTypeLabel.text = keyValue
            cell.displayLabel.text = userData[keyValue]
            return cell
        case .mobileNumber:
             cell.contentTypeLabel.text = keyValue
            cell.displayLabel.text = userData[keyValue]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
//MARK: TableViewCell Custom Cell
class labelTableViewCell:UITableViewCell{
    //MARK: IBOutlet
    @IBOutlet weak var contentTypeLabel:UILabel!
    @IBOutlet weak var displayLabel:UILabel!
}
