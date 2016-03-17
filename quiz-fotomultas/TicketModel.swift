//
//  ticketModel.swift
//  quiz-fotomultas
//
//  Created by centro docente de computos on 4/03/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import Foundation
class TicketModel {
    
    // MARK: - Properties
    var date:String?
    var description:String?
    var price:Int?
    
    // MARK: Init
    init(date:String, description:String, price:Int){
        self.date = date
        self.description = description
        self.price = price
    }
    
    convenience init(){
        self.init(date:"", description:"", price:0)
    }
    
    // MARK: Utils
    class func tickets() ->[TicketModel]{
        var data = [TicketModel]()
        let rawData = [
            ["date":"25 de Agosto 2015","description":"Exceso de velocidad", "price":360000],
            ["date":"10 de Diciembre 2015","description":"Pico y placa", "price":450000],
            ["date":"2 de enero 2016","description":"Semaforo en Rojo", "price":800000],
            ["date":"4 de Marzo 2016","description":"Exceso de velocidad", "price":360000]
        ]
        
        for item in rawData{
            let ticket = TicketModel(date: item["date"] as! String, description: item["description"] as! String, price: item["price"] as! Int)
            data.append(ticket)
        }
        
        return data
    }
    
}