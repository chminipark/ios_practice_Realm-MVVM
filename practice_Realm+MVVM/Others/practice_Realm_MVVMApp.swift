//
//  practice_Realm_MVVMApp.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import SwiftUI

@main
struct practice_Realm_MVVMApp: SwiftUI.App {
  
  var body: some Scene {
    WindowGroup {
      
      
      ContentView()
        .environmentObject(MemberStore())
      
      
    }
  }
}
