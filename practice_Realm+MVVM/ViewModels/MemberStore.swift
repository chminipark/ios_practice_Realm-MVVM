//
//  MemberStore.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import Foundation
import RealmSwift

class MemberStore: ObservableObject {
  var allMemberResults: Results<MemberDB>
  
  init() {
    let realm = try! Realm()
    print(realm.configuration.fileURL)
    print(realm.configuration.schemaVersion)
    allMemberResults = realm.objects(MemberDB.self)
  }
  
  var manMemberList: [Member] {
    allMemberResults
      .filter{ $0.gender == "남자" }
      .map(Member.init)
  }
  
  var womanMemberList: [Member] {
    allMemberResults
      .filter{ $0.gender == "여자" }
      .map(Member.init)
  }
}

extension MemberStore {
  func create(name: String, age: Int, gender: String, note: String) {
    
    objectWillChange.send()
    
    do {
      let memberDB = MemberDB()
      memberDB.id = UUID().hashValue
      memberDB.name = name
      memberDB.age = age
      memberDB.gender = gender
      memberDB.note = note
      
      let realm = try Realm()
      
      try realm.write {
        realm.add(memberDB)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func update(memberId: Int, name: String, age: Int, gender: String, note: String) {
    
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      try realm.write {
        realm.create(
          MemberDB.self,
          value: [
            "id": memberId,
            "name": name,
            "age": age,
            "gender": gender,
            "note": note
          ],
          update: .modified
        )
      }
    } catch let error {
      print(error.localizedDescription)
    }
    
  }
  
  func delete(memberId: Int) {
    
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      
      guard let toDeleteItem = realm.objects(MemberDB.self).first(where: { member in
        member.id == memberId
      }) else {
        return
      }
      
      try realm.write {
        realm.delete(toDeleteItem)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
