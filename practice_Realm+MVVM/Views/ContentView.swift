//
//  ContentView.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
  
  @EnvironmentObject var store: MemberStore
  
  var body: some View {
    MemberListView(manMember: store.manMemberList, womanMember: store.womanMemberList)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
