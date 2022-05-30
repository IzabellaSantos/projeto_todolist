//
//  model.swift
//  Observer
//
//  Created by Izabella Julia dos Santos on 26/05/22.
//

import Foundation

struct CardTask{
    private(set) var tasks: Array<Card>
    
    mutating func addCard(_ task: String){
        tasks.append(Card(id: tasks.count, content: task))
    }
    
    mutating func deleteCard(_ id: Int){
        tasks.removeAll(where: {$0.id == id}) //search where tasks.id (from model) has the same id as in task (sent from the view)
    }
    
    init(){
        tasks = Array<Card>() //initialize the tasks array
    }
    
    struct Card: Identifiable{
        var id: Int
        var content: String
    }
}
