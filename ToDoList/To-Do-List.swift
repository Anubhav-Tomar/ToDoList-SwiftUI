//
//  ToDoList
//  ToDoList
//
//  Created by Anubhav Tomar on 29/08/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoList: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
