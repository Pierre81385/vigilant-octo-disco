//
//  AppEntry.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/22/24.
//

import SwiftUI

struct AppEntry: View {
    @State var apiKey: String = "pk_54098740_LAOBI4UNGKBWPDCEUXVFHWBAYLYJKNZU"
    @State var formComplete: Bool = false
    @State var message: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("API Key")
                    TextField("api key", text: $apiKey).textFieldStyle(.roundedBorder).padding()
                    Text(message)
                    Button(action: {
                        if (apiKey == "") {
                            message = "Please enter your API key."
                        } else {
                            formComplete = true
                        }
                    }, label: {
                        Text("GO")
                    })
                }.navigationDestination(isPresented: $formComplete) {
                    WorkspaceView(token: $apiKey)
                }
            }.tint(Color.black)
        }
    }
}

#Preview {
    AppEntry()
}

