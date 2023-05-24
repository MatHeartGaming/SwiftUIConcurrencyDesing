//
//  DateTitle.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 23/05/23.
//

import SwiftUI

struct DateTitle: View {
    
    var title : AttributedString
    @State private var date : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(date)
                .font(.footnote)
                .fontWeight(.medium)
                .opacity(0.7)
            
            Text(title)
                .font(.largeTitle).bold()
        }
        .accessibilityAddTraits([.isHeader])
        .onAppear {
            date = Date.now.formatted(.dateTime.weekday(.wide).month().day())
        }
    }
}


struct DateTitle_Previews: PreviewProvider {
    
    static var attributedString : AttributedString {
        var subject = AttributedString("SwiftUI")
        
        var container = AttributeContainer()
        container.foregroundColor = .purple
        subject.mergeAttributes(container)
        return "Learn " + subject
    }
    
    static var previews: some View {
        DateTitle(title: attributedString)
    }
}
