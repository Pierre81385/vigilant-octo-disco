//
//  FolderView.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/23/24.
//

import SwiftUI

struct FolderView: View {
    @Binding var token: String
    var space: Space
    @EnvironmentObject var network: Network
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Folders in \(space.name ?? "Space")")
                            .font(.title).bold()
                VStack(alignment: .leading) {
                    ForEach(network.folders) { folder in
                        NavigationLink(destination: ListView(token: $token, folder: folder)) {
                            VStack(alignment: .leading) {
                                Text(folder.name)
                                    .bold()
                                Text("ID: \(folder.id)")
                                
                            }
                        }
                        
                    }
                }
                    }
                    .onAppear {
                        network.getFolders(space_id: space.id, token: token)
                    }
        }
        FolderlessListView(token: $token, space: space)
    }
}
