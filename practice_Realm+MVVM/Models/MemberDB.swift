//
//  MemberDB.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import Foundation
import RealmSwift

class MemberDB: Object {
  @Persisted var id = 0
  @Persisted var name = ""
  @Persisted var age = 20
  @Persisted var gender = Gender.man.rawValue
  @Persisted var note = ""
  
  override class func primaryKey() -> String? {
    "id"
  }
}
