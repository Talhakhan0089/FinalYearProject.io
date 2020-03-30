//
//  getMedicinesViewController.swift
//  Back On Your Feet
//
//  Created by Talha Khan on 12/07/2019.
//  Copyright © 2019 Talha Khan. All rights reserved.
//

import UIKit
import UIKit
import FirebaseFirestore
import SVProgressHUD
import FirebaseAuth
class getMedicinesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var currentAilment = ""
    @IBOutlet weak var tableView: UITableView!
    
    
    var medicines:Dictionary<String, AnyObject>!
    override func viewDidLoad() {
        super.viewDidLoad()
        medicines = ["Fetching medicines for You....":0] as Dictionary<String, AnyObject>
        //heartPatient
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.title = "Medicines"
        let db = Firestore.firestore()
        //var dataArray = ["Bone/Joints","Heart Diesease","Diabetes","None"]

        var ref: DocumentReference? = nil
        let uid = Auth.auth().currentUser?.uid
        let docRef = db.collection("profileInfo").document(uid!)
        SVProgressHUD.show(withStatus: "Loading...")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                self.currentAilment = dataDescription?["currentAilment"] as! String
                print(self.currentAilment)
                SVProgressHUD.dismiss()
                
                
                if self.currentAilment == "Bone/Joints"{
                    if let path = Bundle.main.path(forResource: "boneMedication", ofType: "json") {
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                            if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                                self.medicines = jsonResult
                                self.tableView.reloadData()
                            }
                        } catch {
                            // handle error
                        }
                    }
                    else{
                        print("File not found")
                    }
                }
                
                
                else if self.currentAilment == "Heart Diesease"{
                    if let path = Bundle.main.path(forResource: "heartPatientMedication", ofType: "json") {
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                            if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                                self.medicines = jsonResult
                                self.tableView.reloadData()

                            }
                        } catch {
                            // handle error
                        }
                    }
                    else{
                        print("File not found")
                    }
                }
                
                else if self.currentAilment == "Diabetes"{
                    if let path = Bundle.main.path(forResource: "diabeticMedication", ofType: "json") {
                        do {
                            print("Reading....")

                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                            if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                                self.medicines = jsonResult
                                self.tableView.reloadData()
                                print(self.medicines)
                            }
                        } catch {
                            // handle error
                        }
                    }
                    else{
                        print("File not found")
                    }
                }
                
                else{
                    //medicines = ["Data":"No Data Available"]
                    self.alertController(for: "No Data", with:  "No Data Exist for this")
                }
                
                
            } else {
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: "Document does not exist")
                
                print("Document does not exist")
            }
        }
        
        
     
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! medicinesTableViewCell
        cell.nameLabel.text = Array(medicines)[indexPath.row].key
        cell.descriptionLabel.text = Array(medicines)[indexPath.row].value as? String

        cell.descriptionLabel?.isEditable = false
        return cell
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
