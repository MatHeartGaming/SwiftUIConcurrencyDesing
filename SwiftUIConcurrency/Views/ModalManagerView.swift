//
//  ModalManagerView.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import SwiftUI

struct ModalManagerView: View {
    
    @EnvironmentObject var modalManger : ModalManager
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation{
                        modalManger.showModal = false
                    }
                }
            
            switch modalManger.activeModal {
                
            case .singIn : SignInView()
                
            case .singUp : SignUpView()
                
            case .resetPassword : ResetPasswordView()
            }
        }
    }
}

struct ModalManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ModalManagerView()
            .environmentObject(ModalManager())
    }
}
