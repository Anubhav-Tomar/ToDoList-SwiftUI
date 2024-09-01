//
//  SettingRowView.swift
//  ToDoList
//
//  Created by Anubhav Tomar on 31/08/24.
//

import SwiftUI

struct SettingRowView: View {
    
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack (spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color(uiColor: UIColor.systemBackground))
                .colorInvert()
        }
    }
}

#Preview {
    SettingRowView(imageName: "gear", title: "Version", tintColor: .red)
}
