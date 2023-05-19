//
//  ToDoListView.swift
//  RealmToDo-1
//
//  Created by Marcin Jędrzejak on 13/05/2023.
//

// Film: https://www.youtube.com/watch?v=nx3KDnqMU0M&list=PLBn01m5Vbs4B8xgS_iEEuJtM_3BuZ7fiV&ab_channel=StewartLynch

// Useful links:
// Realm Website:
// https://realm.io
//
// Realm Property Types:
// https://www.mongodb.com/docs/realm/sdk/swift/model-data/supported-types/
//
// Realm SDK Repo:
// https://github.com/realm/realm-swift


import SwiftUI
import RealmSwift

struct ToDoListView: View {
    @ObservedResults(ToDo.self) var toDos
    @State private var name = ""
    @State private var searchFilter = ""
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
//                    ForEach(toDos.sorted(byKeyPath: "completed")) { toDo in
                    ForEach(toDos.sorted(by: [
                        SortDescriptor(keyPath: "completed"),
                        SortDescriptor(keyPath: "urgency", ascending: false)
                    ])) { toDo in
                        ToDoListRow(toDo: toDo)
                    }
//                    .onDelete(perform: $toDos.remove)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .searchable(text: $searchFilter,
                            collection: $toDos,
                            keyPath: \.name) {
                    ForEach(toDos) { toDo in
                        Text(toDo.name)
                            .searchCompletion(toDo.name)
                    }
                }
            }
            .animation(.default, value: toDos)
            .navigationTitle("Realm ToDos")
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
