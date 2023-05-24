//
//  ModalManager.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation

class ModalManager: ObservableObject {
    
    enum ActiveModals {
        case singIn
        case singUp
        case resetPassword
    }
    
    @Published public var showModal = false
    @Published public var activeModal : ActiveModals = ActiveModals.singIn
    
    
    
}
