//
//  DetailViewController.swift
//  quiz-fotomultas
//
//  Created by centro docente de computos on 4/03/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate:NSObjectProtocol{
    
    func updateTicket(ticket:TicketModel, withTicket price:Int)
}

class DetailViewController: UIViewController {

    //MARK:- IBOutles
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    //MARK:- Properties
    var ticket = TicketModel()
    var delegate:DetailViewControllerDelegate?
    
    //MARK: IBActions
    
    @IBAction func edit(sender: UIButton) {
        self.view.endEditing(true)
        if editButton.selected{
            editButton.selected = false
            if let priceInt = Int(priceTextField.text!){
                    priceLabel.text = priceTextField.text
                    priceLabel.hidden = false
                    priceTextField.hidden = true
                    delegate?.updateTicket(ticket, withTicket:priceInt)
            }
        }else{
            editButton.selected = true
            priceTextField.hidden = false
            priceLabel.hidden = true
            priceTextField.text = priceLabel.text
        }
        
    }
    
    
    //MARK- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateLabel.text = ticket.date
        descriptionLabel.text = ticket.description
        priceLabel.text = String(ticket.price!)// ! para que n o muestre el valor opcional
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Utils
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
