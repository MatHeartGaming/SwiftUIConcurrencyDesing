//
//  ProfileIcon.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import SwiftUI

struct ProfileIcon: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .font(.body)
                .foregroundColor(.primary)
                .frame(width: 26, height: 26, alignment: .center)
                .mask(Circle())
                .padding(8.8)
        }
        .background(.ultraThinMaterial)
        .mask(Circle())
        .overlay(
            Circle()
                .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.3), lineWidth: 0.5)
        )
        .frame(width: 44, height: 44)
        .accessibilityLabel("Sign in")
        .accessibilityHint("Open sign in modal")
        .accessibilityAddTraits([.isButton])
    }
}

struct ProfileIcon_Previews: PreviewProvider {
    static var previews: some View {
        ProfileIcon()
    }
}
