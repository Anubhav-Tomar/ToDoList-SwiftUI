//
//  User.swift
//  ToDoList
//
//  Created by Anubhav Tomar on 29/08/24.
//

import Foundation

struct User: Codable, Identifiable {
     
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}
