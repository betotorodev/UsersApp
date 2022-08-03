//
//  UserDetailView.swift
//  Users
//
//  Created by Beto Toro on 3/08/22.
//

import SwiftUI

struct UserDetailView: View {
  
  let user: User
  
  var body: some View {
    List {
      Section {
        VStack(alignment: .leading) {
          Text(user.name)
            .font(.title3)
          Text("age: \(user.age)")
            .font(.caption)
        }
      }
      Section("Contac") {
        VStack(alignment: .leading, spacing: 10) {
          Text("email: \(user.email)")
            .font(.subheadline)
          Text("address: \(user.address)")
            .font(.subheadline)
        }
      }
      Section("Friends") {
        ForEach(user.friends, id: \.id) { friend in
          Text(friend.name)
            .font(.subheadline)
        }
      }
    }
    .navigationTitle("User Details")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//struct UserDetailView_Previews: PreviewProvider {
//  static let friend1 = User(id: UUID(), name: "beto")
//  static var previews: some View {
//    UserDetailView(name: "aleja", age: 23, friends: [friend1])
//  }
//}
