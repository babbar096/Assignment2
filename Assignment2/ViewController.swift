//
//  ViewController.swift
//  Assignment2
//
//  Created by user225115 on 7/12/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerdata = ["Courtside","Balcony Level","Lower Level"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let selectedOption = pickerdata[row]
            if selectedOption == "Courtside" {
                priceType.text = "Courtside"
            } else if selectedOption == "Balcony Level" {
                priceType.text = "Balcony Level"
            } else {
                priceType.text = "Lower Level"
            }
            
            let ticketText = "\(pickerdata[row]) \(totalTickets.text) \(totalPrice.text)"
            return ticketText
        }





    
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var totalTickets: UILabel!

    
    @IBOutlet weak var priceType: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    
    @IBOutlet weak var ticketType: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalTickets.text = ""
        ticketType.dataSource = self
        ticketType.delegate = self
        
        // Find the index of the initial/default value in the pickerdata array
        let defaultRow = pickerdata.firstIndex(of: "Courtside") ?? 0
        
        // Set the initial/default value for the UIPickerView
        ticketType.selectRow(defaultRow, inComponent: 0, animated: false)
        priceType.text = pickerdata[defaultRow]
    }


    
    
    @IBAction func clear(_ sender: Any) {
           totalTickets.text = ""
           totalPrice.text = ""
       }
       
       
       @IBAction func Buy(_ sender: Any) {
           
           let selectedOption = pickerdata[ticketType.selectedRow(inComponent: 0)]
           var price = 0
           var result = 0
           if let quantity = Int(totalTickets.text ?? "0"){
               if priceType.text == "Courtside"{
                   price = 20000
               } else if priceType.text == "Balcony Level"{
                   price = 10000
               } else{
                   price = 5000
               }
               result = price * quantity
               totalPrice.text = String(result)
               
               var newPickerValue = " \(selectedOption) \(totalTickets.text) \(totalPrice.text)"
               pickerdata[ticketType.selectedRow(inComponent: 0)] = newPickerValue
               ticketType.reloadAllComponents()
           } else{
               totalPrice.text = "Invalid Input"
           }
           
       }



    
    @IBAction func Zero(_ sender: Any) {
        totalTickets.text?.append("0")
    }
    
    
    @IBAction func One(_ sender: Any) {
        totalTickets.text?.append("1")
    }
    
    
    @IBAction func Two(_ sender: Any) {
        totalTickets.text?.append("2")
    }
    
    
    @IBAction func Three(_ sender: Any) {
        totalTickets.text?.append("3")
    }
    
    
    @IBAction func Four(_ sender: Any) {
        totalTickets.text?.append("4")
    }
    
    
    @IBAction func Five(_ sender: Any) {
        totalTickets.text?.append("5")
    }
    
    @IBAction func Six(_ sender: Any) {
        totalTickets.text?.append("6")
    }
    
    
    @IBAction func Seven(_ sender: Any) {
        totalTickets.text?.append("7")
    }
    
    
    @IBAction func Eight(_ sender: Any) {
        totalTickets.text?.append("8")
    }
    
    
    @IBAction func Nine(_ sender: Any) {
        totalTickets.text?.append("9")
    }
    
    
    
    

}

