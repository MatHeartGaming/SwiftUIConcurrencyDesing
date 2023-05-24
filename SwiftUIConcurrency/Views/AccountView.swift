//
//  AccountView.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    @State private var user : User?
    
    var body: some View {
        VStack {
            if let user = user{
                ProfileCard(user: user)
            } else {
                Text("No user fetched from the server...")
            }
        }
        .task {
            do {
                self.user = try await accountViewModel.getUserAsync()
            } catch let error {
                print("Error while fetching user. \(error.localizedDescription)")
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
