//
//  FeaturedCourseCard.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 23/05/23.
//

import SwiftUI

struct FeaturedCourseCard: View {
    
    var course : Course
    
    var body: some View {
        VStack(spacing: 8) {
            
            AsyncImage(url: URL(string: course.illustration)) {image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 220, alignment: .center)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.2))
            }
            
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text("\(course.numberOfSections) sections - \(course.numberOfHours) hours")
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Text(course.subtitle)
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
        }
        .padding(16)
        .frame(width: 252, height: 350, alignment: .top)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: course.colors.first!!), Color(hex: course.colors.last!!)]),
                           startPoint: .top, endPoint: .bottomLeading)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
            .blendMode(.overlay))
    }
}

struct FeaturedCourseCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseCard(course: coursePreviewData)
    }
}
