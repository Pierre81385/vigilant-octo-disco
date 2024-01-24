//
//  Network.swift
//  vigilant-octo-disco
//
//  Created by Peter Bishop on 1/22/24.
//

import SwiftUI

class Network: ObservableObject {
    @Published var teams: [Team] = []
    @Published var spaces: [Space] = []
    @Published var folders: [Folder] = []
    @Published var lists: [List] = []
    @Published var tasks: [Task] = []
    
    func getTeams(token: String) {
        guard let url = URL(string: "https://api.clickup.com/api/v2/team") else { fatalError("Missing URL") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedTeamsWrapper = try JSONDecoder().decode(TeamResponse.self, from: data)
                        self.teams = decodedTeamsWrapper.teams
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getSpaces(team_id: String, token: String) {
        guard let url = URL(string: "https://api.clickup.com/api/v2/team/\(team_id)/space") else { fatalError("Missing URL") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedSpaceResponse = try JSONDecoder().decode(SpacesResponse.self, from: data)
                        self.spaces = decodedSpaceResponse.spaces
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getFolders(space_id: String, token: String) {
        guard let url = URL(string: "https://api.clickup.com/api/v2/space/\(space_id)/folder") else { fatalError("Missing URL") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedFolderResponse = try JSONDecoder().decode(FolderResponse.self, from: data)
                        self.folders = decodedFolderResponse.folders
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getFolderlessLists(space_id: String, token: String) {
        guard let url = URL(string: "https://api.clickup.com/api/v2/space/\(space_id)/list") else { fatalError("Missing URL") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedListResponse = try JSONDecoder().decode(ListResponse.self, from: data)
                        self.lists = decodedListResponse.lists
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getLists(folder_id: String, token: String) {
        guard let url = URL(string: "https://api.clickup.com/api/v2/folder/\(folder_id)/list") else { fatalError("Missing URL") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedListResponse = try JSONDecoder().decode(ListResponse.self, from: data)
                        self.lists = decodedListResponse.lists
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getTasks(list_id: String, token: String) {
        guard let url = URL(string: "https://api.clickup.com/api/v2/list/\(list_id)/task") else { fatalError("Missing URL") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedTaskResponse = try JSONDecoder().decode(TaskResponse.self, from: data)
                        self.tasks = decodedTaskResponse.tasks
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
