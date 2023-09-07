//
//  Localization.swift
//  CarsPlayer
//
//  Created by Ahmed Elesawy on 28/07/2022.
//

import Foundation

struct Localization {
    
    enum LocalizationKey: String {
        
        case errorMessageGeneric = "error_message_generic"
        case errorMessageCanNotSendRequest = "error_message_can_not_send_request"
        case errorMessageCanNotReadData = "error_message_can_not_read_data"
        case ok = "button_title_ok"
        case encounteredProblem = "encountered_problem"
        
        case titleForAddNewBrand = "title_message_for_and_new_brand"
        case messageForAddNewBrand = "message_for_and_new_brand"
       
    }
    
    static func string(for key: LocalizationKey) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }
}
