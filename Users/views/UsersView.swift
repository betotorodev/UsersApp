//
//  UsersView.swift
//  Users
//
//  Created by Beto Toro on 3/08/22.
//

import SwiftUI

struct UsersView: View {
  @State private var ListOfUsers = [User]()
  
  func loadData() async {
    guard ListOfUsers.isEmpty else { return }
    
    do {
      let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
      let (data, _) = try await URLSession.shared.data(from: url)
      
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      ListOfUsers = try decoder.decode([User].self, from: data)
    } catch {
      print("Invalid data")
    }
  }
  
  var body: some View {
    NavigationView {
      List(ListOfUsers, id: \.id) { user in
        NavigationLink {
          Text("holi")
        } label: {
          HStack {
            Circle()
              .foregroundColor(user.isActive ? Color.green : Color.red)
              .frame(width: 8, height: 8)
            Text("\(user.name)")
          }
        }
      }
      .task {
        await loadData()
      }
      .navigationTitle("Users")
    }
  }
}

struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView()
  }
}
