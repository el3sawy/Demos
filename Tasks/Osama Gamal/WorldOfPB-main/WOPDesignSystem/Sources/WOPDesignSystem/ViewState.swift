import Foundation

public enum ViewState<T> {
    case idle
    case loading
    case content(T)
    case empty
    case error(Error)
}
