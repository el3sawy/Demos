//
//  PasswordChanger.swift
//  ChangePassword
//
//  Created by Ahmed Elesawy on 16/01/2022.
//

import Foundation

protocol PasswordChanging {
    func change(securityToken: String,
                oldPassword: String,
                newPassword: String,
                onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void)
}
private struct SuccessOrFailureTimer {
    let onSuccess: () -> Void
    let onFailure: (String) -> Void
    let timer: Timer
}
final class PasswordChanger: PasswordChanging {
    private static var pretendToSucceed = false
    private var successOrFailureTimer: SuccessOrFailureTimer?
    
    func change(securityToken: String, oldPassword: String, newPassword: String,
                onSuccess: @escaping () -> Void,
                onFailure: @escaping (String) -> Void) {
        successOrFailureTimer = SuccessOrFailureTimer(onSuccess: onSuccess, onFailure: onFailure, timer: Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self]  _ in
            self?.callSuccessOrFailure()
        }))
    }
    
    private func callSuccessOrFailure() {
        if PasswordChanger.pretendToSucceed {
            successOrFailureTimer?.onSuccess()
            
        } else {
            successOrFailureTimer?.onFailure("Sorry, something went wrong.")
        }
        PasswordChanger.pretendToSucceed.toggle()
        successOrFailureTimer?.timer.invalidate()
        successOrFailureTimer = nil
    }
}
