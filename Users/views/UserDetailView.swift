//
//  UserDetailView.swift
//  Users
//
//  Created by Beto Toro on 3/08/22.
//

import SwiftUI

struct UserDetailView: View {
  
  let user: CachedUser
  
  var body: some View {
    List {
      Section {
        VStack(alignment: .leading) {
          Text(user.wrappedName)
            .font(.title3)
          Text("age: \(user.wrappedAge)")
            .font(.caption)
        }
      }
      Section("Contac") {
        VStack(alignment: .leading, spacing: 10) {
          Text("email: \(user.wrappedEmail)")
            .font(.subheadline)
          Text("address: \(user.wrappedAddress)")
            .font(.subheadline)
        }
      }
      Section("Friends") {
        ForEach(user.friendsArray, id: \.id) { friend in
          Text(friend.wrappedName)
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
