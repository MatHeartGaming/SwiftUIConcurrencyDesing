//
//  FeaturedCourseList.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 23/05/23.
//

import SwiftUI

struct FeaturedCourseList: View {
    
    var featuredCourses : [Course]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if !featuredCourses.isEmpty {
                    ForEach(featuredCourses, id: \.id) {course in
                        NavigationLink {
                            CourseView(course: course)
                        } label: {
                            FeaturedCourseCard(course: course)
                                .frame(width: 252, height: 350)
                        }

                        
                    }
                } else {
                    ForEach(0..<4, id: \.self) {num in
                        FeaturedCourseCard(course: coursePreviewData)
                            .frame(width: 252, height: 350)
                            .redacted(reason: .placeholder)
                    }
                    
                }
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FeaturedCourseList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseList(featuredCourses: [coursePreviewData])
    }
}
