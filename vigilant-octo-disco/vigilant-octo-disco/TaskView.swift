//
//  TaskView.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/23/24.
//

import SwiftUI

struct TaskView: View {
    @Binding var token: String
    var list: List
    @EnvironmentObject var network: Network
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Tasks in \(list.name)")
                    .font(.title).bold()
                VStack(alignment: .leading) {
                    ForEach(network.tasks) { task in
                        NavigationLink(destination: TaskView(token: $token, list: list)) {
                            VStack(alignment: .leading) {
                                Text(task.name)
                                    .bold()
                                Text("ID: \(task.id)")
                                
                            }
                        }
                        
                    }
                }
            }
            .onAppear {
                network.getTasks(list_id: list.id, token: token)
            }
        }
    }
}

