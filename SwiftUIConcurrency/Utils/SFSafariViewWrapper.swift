//
//  SFSafariViewWrapper.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation
import SafariServices
import SwiftUI

struct SFSafariViewWrapper : UIViewControllerRepresentable {
    
    let url : URL
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
    
}
