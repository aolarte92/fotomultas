//
//  DetailViewController.swift
//  quiz-fotomultas
//
//  Created by centro docente de computos on 4/03/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK:- IBOutles
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    //MARK:- Properties
    var ticket = TicketModel()
    
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

}
