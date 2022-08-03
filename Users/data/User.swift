//
//  User.swift
//  Users
//
//  Created by Beto Toro on 3/08/22.
//

import Foundation

struct User: Codable {
  let id: String
  let isActive: Bool
  let name: String
  let company: String
  let email: String
  let address: String
  let about: String
  let registered: String
  let tags: [String]
  let friends: [Friend]
}
