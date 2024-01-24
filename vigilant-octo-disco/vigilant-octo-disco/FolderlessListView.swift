//
//  FolderlessListView.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/23/24.
//

import SwiftUI

struct FolderlessListView: View {
    @Binding var token: String
    var space: Space
    @EnvironmentObject var network: Network
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Folderless Lists in \(space.name ?? "Space") Space")
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
                        network.getFolderlessLists(space_id: space.id, token: token)
                    }
        }
    }
}
