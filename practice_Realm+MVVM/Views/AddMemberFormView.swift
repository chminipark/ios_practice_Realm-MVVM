//
//  AddMemberFormView.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import SwiftUI

struct AddMemberFormView: View {
  
  @EnvironmentObject var store: MemberStore
  @ObservedObject var form: MemberForm
  
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    NavigationView {
      Form {
        
        TextField("이름을 입력하세요", text: $form.name)
        
        Picker(selection: $form.age) {
          ForEach(1...100, id: \.self) { age in
            Text("\(age)")
          }
        } label: {
          Text("나이")
        }
        
        Picker(selection: $form.gender) {
          ForEach(Gender.allCases, id: \.self) { gender in
            Text(gender.rawValue)
          }
        } label: {
          Text("성별")
        }
        
        Section {
          TextField("", text: $form.note)
        } header: {
          Text("Notes📝")
        }

      } // Form
      .navigationTitle(Text("새로운 멤버"))
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Text("취소")
          }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            form.isUpdating ? updatingMember() : saveMember()
          } label: {
            form.isUpdating ? Text("수정") : Text("추가")
          }
        }
      }
      
    } // NavigationView
  } // body
}


extension AddMemberFormView {
  func dismiss() {
    presentationMode.wrappedValue.dismiss()
  }
  
  func saveMember() {
    store.create(name: form.name, age: form.age, gender: form.gender.rawValue, note: form.note)
    self.dismiss()
  }
  
  func updatingMember() {
    store.update(memberId: form.memberId!, name: form.name, age: form.age, gender: form.gender.rawValue, note: form.note)
    self.dismiss()
  }
}

struct AddMemberFormView_Previews: PreviewProvider {
  static var previews: some View {
    AddMemberFormView(form: MemberForm())
  }
}
