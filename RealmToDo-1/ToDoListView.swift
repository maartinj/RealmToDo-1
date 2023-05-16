//
//  ToDoListView.swift
//  RealmToDo-1
//
//  Created by Marcin Jędrzejak on 13/05/2023.
//

// Film: https://www.youtube.com/watch?v=nx3KDnqMU0M&list=PLBn01m5Vbs4B8xgS_iEEuJtM_3BuZ7fiV&ab_channel=StewartLynch

import SwiftUI
import RealmSwift

struct ToDoListView: View {
    @ObservedResults(ToDo.self) var toDos
    @State private var name = ""
    @FocusState private var focus: Bool?
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New ToDo", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button {
                        let newToDo = ToDo(name: name)
                        $toDos.append(newToDo)
                        name = ""
                        focus = nil
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(name.isEmpty)

                }
                .padding()
                List() {
                    ForEach(toDos) { toDo in
                        Text(toDo.name)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Realm ToDos")
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}