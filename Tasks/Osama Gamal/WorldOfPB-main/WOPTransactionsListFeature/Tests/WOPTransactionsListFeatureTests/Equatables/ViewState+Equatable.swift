//
//  ViewState+Equatable.swift
//  
//
//  Created by Osama Gamal on 08/05/2023.
//

@testable import WOPDesignSystem

// MARK: - ViewState

extension ViewState: Equatable where T: Equatable {
  public static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
    switch (lhs, rhs) {
    case (.idle, .idle), (.loading, .loading), (.error, .error), (.empty, .empty):
      return true
    case let (.content(lhsValue), .content(rhsValue)):
      return lhsValue == rhsValue
    default:
      return false
    }
  }
}
