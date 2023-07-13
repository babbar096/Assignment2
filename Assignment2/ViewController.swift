//
//  ViewController.swift
//  Assignment2
//
//  Created by user225115 on 7/12/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerdata = ["Courtside","Balcony Level","Lower Level"]
    var numberOfTickets = ["12", "20", "15"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectedOption = pickerdata[row]
        let ticketCount = numberOfTickets[row]
        let price = getPrice(for: selectedOption)
        
        let ticketText = "\(selectedOption), \(ticketCount) tickets, $\(price)"
        return ticketText
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedOption = pickerdata[row]
        priceType.text = selectedOption
        totalTickets.text = ""
        // Update the number of tickets in the selected row
        let remainingTickets = Int(numberOfTickets[row]) ?? 0
        
    }


    func getPrice(for option: String) -> Int {
            if option == "Courtside" {
                return 27777
            } else if option == "Balcony Level" {
                return 1170
            } else {
                return 10434
            }
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
    }


    
    
    @IBAction func clear(_ sender: Any) {
           totalTickets.text = ""
           totalPrice.text = ""
       }
       
       
    @IBAction func Buy(_ sender: Any) {
        let selectedRow = ticketType.selectedRow(inComponent: 0)
        let selectedOption = pickerdata[selectedRow]
        
        guard let quantity = Int(totalTickets.text ?? "0") else {
            totalPrice.text = "Invalid Input"
            return
        }
        
        let availableTickets = Int(numberOfTickets[selectedRow]) ?? 0
        
        if quantity > availableTickets {
            totalPrice.text = "Not enough tickets available"
        } else {
            let price = getPrice(for: selectedOption)
            let result = price * quantity
            totalPrice.text = String(result)
            
            // Update the number of tickets in the selected row
            numberOfTickets[selectedRow] = String(availableTickets - quantity)
            ticketType.reloadAllComponents()
            
            // Reset the selected row to the first row (0 index) if available
            if pickerdata.indices.contains(0) {
                ticketType.selectRow(0, inComponent: 0, animated: false)
                priceType.text = pickerdata[0]
            } else {
                priceType.text = ""
            }
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

