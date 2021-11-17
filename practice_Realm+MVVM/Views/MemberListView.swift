//
//  MemberListView.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import SwiftUI
import RealmSwift

struct MemberListView: View {
  
  @EnvironmentObject var store: MemberStore
  
  let manMember: [Member]
  let womanMember: [Member]
  
  @State private var isShowingAddMemberFormView = false
  
  var body: some View {
    NavigationView {
      ZStack {
        List {
          Section {
            if manMember.isEmpty {
              Text("아무도 없어요..😥")
            } else {
              ForEach(manMember) { member in
                MemberListRowView(member: member)
              }
              .onDelete { indexSet in
                let idsToDelete = indexSet.map { manMember[$0].id }
                store.delete(memberId: idsToDelete[0])
              }
            }
          } header: {
            Text("남자")
          }
          
          Section {
            if womanMember.isEmpty {
              Text("아무도 없어요..😥")
            } else {
              ForEach(womanMember) { member in
                MemberListRowView(member: member)
              }
              .onDelete { indexSet in
                let idsToDelete = indexSet.map { womanMember[$0].id }
                store.delete(memberId: idsToDelete[0])
              }
            }
          } header: {
            Text("여자")
          }
        }
        .navigationTitle(Text("ios 스터디 멤버 👻"))
        .listStyle(GroupedListStyle())
        .sheet(isPresented: $isShowingAddMemberFormView) {
          AddMemberFormView(form: MemberForm())
            .environmentObject(self.store)
        }
        
        FloatingButton
          .padding()
      } // Zstack
    } // NavigationView
  } //body
  
  var FloatingButton: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        
        Button {
          isShowingAddMemberFormView.toggle()
        } label: {
          Image(systemName: "plus.circle.fill")
            .font(.system(size: 50))
            .foregroundColor(.green)
        }
      }
    }
  }
  
}

//extension MemberListView {
//  func saveDummy() {
//    for member in MemberMock.manMemberMock {
//      store.create(name: member.name, age: member.age, gender: member.gender, note: member.note)
//    }
//    for member in MemberMock.womanMemberMock {
//      store.create(name: member.name, age: member.age, gender: member.gender, note: member.note)
//    }
//  }
//}

struct MemberListView_Previews: PreviewProvider {
  static var previews: some View {
    MemberListView(manMember: MemberMock.manMemberMock, womanMember: MemberMock.womanMemberMock)
  }
}
