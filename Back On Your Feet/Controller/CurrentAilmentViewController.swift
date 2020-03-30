//
//  CurrentAilmentViewController.swift
//  Back On Your Feet
//
//  Created by Talha Khan on 19/06/2019.
//  Copyright © 2019 Talha Khan. All rights reserved.
//

import UIKit


protocol currentAilmentDelegate:class {
    func chooseCurrentAilment(selectedAilment:String)
}

class CurrentAilmentViewController: UIViewController {
    var dataArray = ["Bone/Joints","Heart Diesease","Diabetes","None"]
    var selectedData:String = String()
    weak var delegate:currentAilmentDelegate?
    //@IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func SaveButtonPressed(_ sender: Any) {
        if selectedData.isEmpty{
            ShowAlert(title: "Error", message: "Please select an option")
        }
        else{

            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)

          // presentingViewController?.dismiss(animated: false, completion: nil)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CurrentAilmentViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        tableView.layer.cornerRadius = 10.0
        cell.selectionStyle = .none
        cell.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        cell.textLabel?.font = UIFont(name: "Avenir", size: 24)
        tableView.layer.masksToBounds = true
        tableView.separatorColor = #colorLiteral(red: 0.2016202807, green: 0.463247776, blue: 0.6151759624, alpha: 1)
        cell.textLabel?.textAlignment = .center
        if selectedData.contains(dataArray[indexPath.row]) {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedData.contains(dataArray[indexPath.row]) {
            selectedData.removeLast()
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            selectedData.removeAll()
            selectedData.append(dataArray[indexPath.row])
            delegate?.chooseCurrentAilment(selectedAilment: selectedData)
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}


extension UIViewController{
    func ShowAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}