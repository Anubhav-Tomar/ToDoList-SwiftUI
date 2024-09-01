//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Anubhav Tomar on 29/08/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toogleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
            db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictonary())
    }
}
