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
    
    mutating func deleteCard(_ task: Int){
        tasks.removeAll(where: {$0.id == task})
    }
    
    init(){
        tasks = Array<Card>()
    }
    
    struct Card: Identifiable{
        var id: Int
        var content: String
    }
}
