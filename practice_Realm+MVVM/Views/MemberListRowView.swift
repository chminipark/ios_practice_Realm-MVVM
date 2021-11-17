//
//  MemberListRowView.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import SwiftUI

struct MemberListRowView: View {
  
  let member: Member
  
  @State private var isShowEditMemberFormView = false
  
  var body: some View {
    Button  {
      isShowEditMemberFormView.toggle()
    } label: {
      HStack {
        Text("\(member.age)")
        
        VStack(alignment: .leading) {
          Text(member.name)
          Text(member.note)
            .foregroundColor(.gray)
            .bold()
        }
      }
      .foregroundColor(.black)
    }
    .sheet(isPresented: $isShowEditMemberFormView) {
      let memberForm = MemberForm(member)
      AddMemberFormView(form: memberForm)
    }
    
  } // body
}

struct MemberListRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MemberListRowView(member: MemberMock.minii)
      MemberListRowView(member: MemberMock.nareun)
    }
    .previewLayout(.sizeThatFits)
  }
}
