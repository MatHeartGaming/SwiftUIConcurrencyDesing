//
//  CourseList.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 23/05/23.
//

import SwiftUI

struct CourseList: View {
    
    var courses : [Course]
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            if(!courses.isEmpty){
                ForEach(courses, id: \.id) {course in
                    CourseCard(course: course)
                }
            } else {
                ForEach(0..<4, id: \.self) {num in
                    CourseCard(course: coursePreviewData)
                        .redacted(reason: .placeholder)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList(courses: [coursePreviewData])
    }
}
