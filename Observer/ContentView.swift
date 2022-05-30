//
//  ContentView.swift
//  Observer
//
//  Created by Izabella Julia dos Santos on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    
    //@ObservedObject tells the view that when the model changes, the view has to rebuild
    @ObservedObject var viewModel: Communication //gets the @Publish var
    
    //the @State is used when you modify a var in your view
    @State var textInput: String = ""
    @State var taskIdDelete: Int = 0
    @State var showingAlert = false
    
    let columns = [
        GridItem(.flexible()) //one column that adapts with the screen size
    ]
                 
    var body: some View {
        VStack{
            Text("TO DO LIST").font(.largeTitle).foregroundColor(.purple).fontWeight(.bold)
            
            ScrollView{
                
                //LazyVGrid makes the app follow the columns set previously
                LazyVGrid(columns: columns){
                    
                    //for each task it creats a new card
                    ForEach(viewModel.tasks){ task in
                        TaskView(task: task)
                            .onTapGesture {
                                showingAlert = true
                                taskIdDelete = task.id
                            }
                    }
                }
            }
            
            //show an alert asking if the person wants to delete the card
            .alert(isPresented: $showingAlert){
                Alert(
                    title: Text("Delete task?"),
                    message: Text("This task will be permanently deleted from this list."),
                    primaryButton: .default(Text("Cancel")), //if not, close it
                    secondaryButton: .default(Text("Delete")){
                        viewModel.deleteCard(cardId: taskIdDelete) //if yes, call the function from viewModel to delete it
                    }
                )
            }
            
            HStack{
                TextField(
                  "task...",
                  text: $textInput
                )
                .padding(5)
                .font(.title3)
                //overlay the input border and brings up the new "border"
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.purple, lineWidth: 2)
                )
                
                Spacer()
                
                add
                .font(.largeTitle)
            }
            .padding()
            .foregroundColor(.purple)
            
            
        }
        .padding(.horizontal)
        .background(Color(.systemGray6))
    }
    
    var add: some View{
        Button {
            viewModel.addCard(cardContent: textInput) //calls the function from viewModel to add a card
            textInput = "" //clear the textfield
        } label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        }
    }

}

struct TaskView: View{
    let task: CardTask.Card
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .fill(.white)
                .frame(height: 100)
            Text(task.content).font(.caption).padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let app = Communication() //calls the observer class
        ContentView(viewModel: app)
    }
}
