//
//  RegistreViewViewModel.swift
//  ToDoList
//
//  Created by Anubhav Tomar on 29/08/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserId(id: userId)
        }
    }
    
    private func insertUserId(id: String) {
        
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictonary())
    }
    
    func validate() -> Bool {
        
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Length of password should be more than 5."
            return false
        }
        
        return true
    }
}
