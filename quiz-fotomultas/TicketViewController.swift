//
//  TicketViewController.swift
//  quiz-fotomultas
//
//  Created by centro docente de computos on 4/03/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController , UITableViewDataSource, UITableViewDelegate
{

    // MARK: - Properties
    var tickets = [TicketModel]()
    let cellIdentifier = "ticketCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         tickets = TicketModel.tickets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

        
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //as! para castear forsadamente un tipo. solo si se esta seguro cual tipo es
        //let detailVC = segue.destinationViewController as! DetailViewController
        //otra opcion
        if let detailVC = segue.destinationViewController as? DetailViewController{
            if let ticket = sender as? TicketModel{
                detailVC.ticket = ticket//pendiente
            }
            
        }
    }
    
    
    // MARK: - UITableViewDataSource
    //para retornar algun valor en una funcion se usa -> tipodato
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        let ticket = tickets[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = ticket.date
        cell?.detailTextLabel?.text = String(ticket.description!)
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let ticket = tickets[indexPath.row]
        self.performSegueWithIdentifier("detail", sender: ticket)
    }

}
