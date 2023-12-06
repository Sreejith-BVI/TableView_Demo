//
//  ViewController.swift
//  tableViewTask1
//
//  Created by Sreejith Warrier on 02/08/23.
//

import UIKit
//MARK: Cell Content ENUM
enum CellContentType:CaseIterable{
    case mobileNumber
    case lastName
    case address
    case firstName
}

class ViewController: UIViewController {
    //MARK: IBOUTLET
    @IBOutlet weak var myTable:UITableView!
     
    var userData:[String:String] = [:]
    //change array
    //MARK: View LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       initialSetup()
        // Do any additional setup after loading the view.
    }
    //MARK: Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue"{
            if let destVc = segue.destination as? SecondViewController{
                destVc.userData = userData
            }
        }
    }
}
//MARK: Private Class Method
extension ViewController{
    private func initialSetup(){
        myTable.delegate = self
        myTable.dataSource = self
    }
    @objc func navigate(){
        clearTextFields()
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    private func clearTextFields(){
        for row in 0..<4{
            let indexPath = IndexPath(row: row, section: 0)
            if let cell = myTable.dequeueReusableCell(withIdentifier: "formTableViewCell", for: indexPath) as? FormTableViewCell{
                cell.userInputTFT.text = ""
            }
            myTable.reloadData()
        }
    }
    
}
//MARK: TableVIew Delegate Method
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        if indexPath.row < 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "formTableViewCell", for: indexPath) as! FormTableViewCell
            cell.userInputTFT.tag = indexPath.row + 1
            cell.data = { [weak self] (title,value) in
                self?.userData[title] = value
            }
            
            switch CellContentType.allCases[indexPath.row]{
            case .firstName:
                cell.contentlbl.text = "First Name"
                return cell
            case .lastName:
                cell.contentlbl.text = "Last Name"
                return cell
            case .address:
                cell.contentlbl.text = "Address"
                return cell
            case .mobileNumber:
                cell.contentlbl.text = "Mobile Number"
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonTableViewCell", for: indexPath) as! CustomButtonTableViewCell
            cell.submitBtn.setTitle("Submit", for: .normal)
            cell.submitBtn.addTarget(self, action: #selector(navigate), for: .touchUpInside)
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
}
