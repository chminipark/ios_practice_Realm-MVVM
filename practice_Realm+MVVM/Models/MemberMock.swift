//
//  MemberMock.swift
//  practice_Realm+MVVM
//
//  Created by minii on 2021/11/15.
//

import Foundation
import RealmSwift

enum MemberMock {

  static let minii = Member(id: 0, name: "미니", age: 50, gender: Gender.man.rawValue, note: "붓싼남자")
  static let nareun = Member(id: 1, name: "나른", age: 20, gender: Gender.woman.rawValue, note: "두목")
  static let sujung = Member(id: 2, name: "임수정", age: 21, gender: Gender.woman.rawValue, note: "영화배우")
  static let ian = Member(id: 3, name: "이안", age: 22, gender: Gender.man.rawValue, note: "붓산어디살아여")
  static let K = Member(id: 4, name: "K", age: 23, gender: Gender.man.rawValue, note: "코테깡패")
  static let hong = Member(id: 5, name: "홍홍", age: 24, gender: Gender.man.rawValue, note: "형돈이가 랩을 한다 홍홍!")
  static let yeon = Member(id: 6, name: "연이", age: 25, gender: Gender.woman.rawValue, note: "테크연, 나도 코딩 잘하고 싶다")
  static let gong = Member(id: 7, name: "공", age: 26, gender: Gender.man.rawValue, note: "강낭콩")
  static let gogo = Member(id: 8, name: "꼬꼬", age: 27, gender: Gender.man.rawValue, note: "저번주 생일이었는데 푸라닭 먹었어여")
  static let taegyun = Member(id: 9, name: "태균", age: 28, gender: Gender.man.rawValue, note: "Take One, 컬투")
  static let mel = Member(id: 10, name: "멜", age: 29, gender: Gender.man.rawValue, note: "사무엘 멜 넬 기억을 걷는 시간 디아블로금지")

  static let manMemberMock = [minii, ian, mel, taegyun, gogo, K, hong, gong]
  static let womanMemberMock = [nareun, sujung, yeon]
  
}

