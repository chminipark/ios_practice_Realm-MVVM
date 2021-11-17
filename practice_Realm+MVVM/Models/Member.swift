//
//  Member.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import Foundation

struct Member: Identifiable {
  let id: Int
  let name: String
  let age: Int
  let gender: String
  let note: String
}

extension Member {
  init(memberDB: MemberDB) {
    id = memberDB.id
    name = memberDB.name
    age = memberDB.age
    gender = memberDB.gender
    note = memberDB.note
  }
}
