//
//  ContentView.swift
//  pia12firebase
//
//  Created by Robin Alwert on 2023-11-20.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var addtodo = ""
    
    @StateObject var todoapi = TodoAPI()

    var body: some View {
        VStack {
            HStack{
                TextField("Todo...", text: $addtodo)
                
                Button(action: {
                    todoapi.savetodo(addtodo: addtodo)
                }, label: {
                    Text("ADD")
                })
            }
            HStack{
                Spacer()

                Button(action: {
                    todoapi.filtertodo(newfilter: .all)
                }, label: {
                    Text("All")
                })
                Spacer()
                Button(action: {
                    todoapi.filtertodo(newfilter: .notdone)
                }, label: {
                    Text("Not done")
                })
                Spacer()

                Button(action: {todoapi.filtertodo(newfilter: .done)
                }, label: {
                    Text("Done")
                })
                Spacer()}
            

            List{
                ForEach(todoapi.todoitems, id: \.self.title){ todo in
                    HStack{
                        Text(todo.title)
                        
                        Spacer()
                        VStack{
                            if todo.isdone{
                                Text("Klar")
                            }else {
                                Text ("Inte klar")
                            }
                        }
                        .onTapGesture {
                            print ("Kick på " + todo.title)
                            todoapi.changeDone(doneitem: todo)
                        }
                        
                        
                        Button(action: {
                            todoapi.deleteTodo(deleteitem: todo)
                        }, label: {
                            Text("X")
                        })
                    }
                    
                }
            }
            Button(action: {
                do{
                    try  Auth.auth().signOut()
                } catch{
                    
                }
            }, label: {
                Text("Logout")
            })
            
        }
        .padding()
        .onAppear(){
            //dofbstuff()
            todoapi.loadtodo()
        
    }
    
    }
}

#Preview {
    ContentView()
}




