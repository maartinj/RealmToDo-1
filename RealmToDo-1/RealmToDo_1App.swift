//
//  RealmToDo_1App.swift
//  RealmToDo-1
//
//  Created by Marcin Jędrzejak on 13/05/2023.
//

import SwiftUI

@main
struct RealmToDo_1App: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path())
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
