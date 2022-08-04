//
//  CachedFriend+CoreDataProperties.swift
//  Users
//
//  Created by Beto Toro on 4/08/22.
//
//

import Foundation
import CoreData


extension CachedFriend {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
    return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
  }
  
  @NSManaged public var name: String?
  @NSManaged public var id: UUID?
  @NSManaged public var origin: CachedUser?
  
  public var wrappedId: UUID {
    id ?? UUID()
  }
  public var wrappedName: String {
    name ?? "none"
  }
  
}

extension CachedFriend : Identifiable {
  
}
