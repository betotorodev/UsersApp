//
//  User.swift
//  Users
//
//  Created by Beto Toro on 3/08/22.
//

import Foundation

struct User: Identifiable, Codable {
  var id: UUID
  var isActive: Bool
  var name: String
  var age: Int
  var company: String
  var email: String
  var address: String
  var about: String
  var registered: Date
  var tags: [String]
  var friends: [Friend]
}
