//
//  viewModel.swift
//  Observer
//
//  Created by Izabella Julia dos Santos on 26/05/22.
//

import SwiftUI

class TasksViewModel: ObservableObject {
    typealias Task = CardTask.Card
    @Published private var model = CardTask() //initialize the model var
    
    //calls the model useful functions and vars
    var tasks: Array<Task> {
        model.tasks
    }
    
    func addCard(cardContent: String) {
        model.addCard(cardContent)
    }
    
    func deleteCard(cardId: Int) {
        model.deleteCard(cardId)
    }
}
