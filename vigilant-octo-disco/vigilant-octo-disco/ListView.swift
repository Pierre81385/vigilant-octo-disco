//
//  ListView.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/23/24.
//

import SwiftUI

struct ListView: View {
    @Binding var token: String
    var folder: Folder
    @EnvironmentObject var network: Network
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Lists in \(folder.name)")
                    .font(.title).bold()
                VStack(alignment: .leading) {
                    ForEach(network.lists) { list in
                        NavigationLink(destination: TaskView(token: $token, list: list)) {
                            VStack(alignment: .leading) {
                                Text(list.name)
                                    .bold()
                                Text("ID: \(list.id)")
                                
                            }
                        }
                        
                    }
                }
            }
            .onAppear {
                network.getLists(folder_id: folder.id, token: token)
            }
        }
    }
}
