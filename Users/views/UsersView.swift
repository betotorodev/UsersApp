//
//  UsersView.swift
//  Users
//
//  Created by Beto Toro on 3/08/22.
//

import SwiftUI

struct UsersView: View {
  @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var ListOfUsers: FetchedResults<CachedUser>
  @Environment(\.managedObjectContext) var moc
  
  func updateCache(with downloadedUsers: [User]) {
    for user in downloadedUsers {
      let cachedUser = CachedUser(context: moc)
      cachedUser.id = user.id
      cachedUser.isActive = user.isActive
      cachedUser.name = user.name
      cachedUser.age = Int16(user.age)
      cachedUser.company = user.company
      cachedUser.email = user.email
      cachedUser.address = user.address
      cachedUser.about = user.about
      cachedUser.registered = user.registered
      cachedUser.tags = user.tags.joined(separator: ",")
      for friend in user.friends {
        let friendData = CachedFriend(context: moc)
        friendData.id = friend.id
        friendData.name = friend.name
        cachedUser.addToFriends(friendData)
      }
    }
    try? moc.save
    //end fuction
  }
  
  func loadData() async {
    guard ListOfUsers.isEmpty else { return }
    
    do {
      let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
      let (data, _) = try await URLSession.shared.data(from: url)
      
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      let users = try decoder.decode([User].self, from: data)
      
      // save in Core Data
      await MainActor.run {
          updateCache(with: users)
      }
      // end do block
    } catch {
      print("Invalid data")
    }
  }
  
  var body: some View {
    NavigationView {
      List(ListOfUsers) { user in
        NavigationLink {
//          UserDetailView(user: user)
        } label: {
          HStack {
            Circle()
              .foregroundColor(user.isActive ? Color.green : Color.red)
              .frame(width: 8, height: 8)
            Text("\(user.wrappedName)")
          }
        }
        .disabled(user.isActive == false)
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
