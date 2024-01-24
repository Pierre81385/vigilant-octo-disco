//
//  SpaceView.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/23/24.
//

import SwiftUI

struct SpaceView: View {
    @Binding var token: String
    var team: Team
    @EnvironmentObject var network: Network
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Spaces in \(team.name)")
                            .font(.title).bold()
                VStack(alignment: .leading) {
                    ForEach(network.spaces) { space in
                        NavigationLink(destination: FolderView(token: $token, space: space)) {
                            VStack(alignment: .leading) {
                                Text(space.name ?? "Space")
                                    .bold()
                                Text("ID: \(space.id)")
                                
                            }
                        }
                        
                    }
                }
                    }
                    .onAppear {
                        network.getSpaces(team_id: team.id, token: token)
                    }
        }
    }
}
