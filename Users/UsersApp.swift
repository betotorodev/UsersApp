//
//  UsersApp.swift
//  Users
//
//  Created by Beto Toro on 3/08/22.
//

import SwiftUI

@main
struct UsersApp: App {
  @StateObject private var dataController = DataController()
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, dataController.container.viewContext)
    }
  }
}
