//
//  MemberForm.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import Foundation

class MemberForm: ObservableObject {
  @Published var name = ""
  @Published var age = 20
  @Published var gender = Gender.man
  @Published var note = ""
  
  var memberId: Int?
  
  var isUpdating: Bool {
    memberId != nil
  }
  
  init() {}
  
  init(_ member: Member) {
    name = member.name
    age = member.age
    gender = Gender(rawValue: member.gender) ?? .man
    note = member.note
    memberId = member.id
  }
}
