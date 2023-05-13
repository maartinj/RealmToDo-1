//
//  ContentView.swift
//  RealmToDo-1
//
//  Created by Marcin Jędrzejak on 13/05/2023.
//

// Film: https://www.youtube.com/watch?v=nx3KDnqMU0M&list=PLBn01m5Vbs4B8xgS_iEEuJtM_3BuZ7fiV&ab_channel=StewartLynch

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
