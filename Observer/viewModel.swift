//
//  viewModel.swift
//  Observer
//
//  Created by Izabella Julia dos Santos on 26/05/22.
//

import SwiftUI

class Communication: ObservableObject{
    
    @Published private var model: CardTask = CardTask()
    
    var tasks: Array<CardTask.Card>{
        model.tasks
    }
    
    func addCard(cardContent: String){
        model.addCard(cardContent)
    }
    
    func deleteCard(cardId: Int){
        model.deleteCard(cardId)
    }
}
