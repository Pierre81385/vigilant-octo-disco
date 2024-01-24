//
//  GetWorkspace.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/22/24.
//

import SwiftUI

struct WorkspaceView: View {
    @Binding var token: String
    @EnvironmentObject var network: Network
    var body: some View {
        NavigationStack {
            ScrollView {
                            Text("My Workspaces")
                            .font(.title).bold()
                VStack(alignment: .leading) {
                    ForEach(network.teams) { team in
                        
                        NavigationLink(destination: SpaceView(token: $token, team: team)) {
                            VStack(alignment: .leading) {
                                Text(team.name)
                                    .bold()
                                Text("ID: \(team.id)")
                                
                            }
                        }
                    }
                }
                    }
                    .onAppear {
                            network.getTeams(token: token)
                    }
        }
    }
}


