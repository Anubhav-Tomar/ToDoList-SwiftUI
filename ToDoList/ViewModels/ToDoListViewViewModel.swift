//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Anubhav Tomar on 29/08/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
