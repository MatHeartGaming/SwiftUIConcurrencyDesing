//
//  CourseModel.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation

typealias CourseData = CourseQuery.Data.CourseCollection

struct CoursesCollection : Decodable {
    
    let courses : [Course]
    
    init(_ coursesCollection : CourseData?) {
        self.courses = coursesCollection?.courses.map({ course -> Course in
            Course(course)
        }) ?? []
    }
    
}

struct Course : Identifiable, Decodable {
    
    let id : String
    let publishedAt : String
    let title : String
    let subtitle : String
    let numberOfSections : Int
    let numberOfHours : Int
    let subject : String
    let colors : [String?]
    let illustration : String
    let sectionCollection : SectionsCollection?
    
    init(_ course : CourseData.Course?) {
        self.id = course?.sys.id ?? ""
        self.publishedAt = course?.sys.publishedAt ?? ""
        self.title = course?.title ?? ""
        self.subtitle = course?.subtitle ?? ""
        self.subject = course?.subject ?? ""
        self.numberOfSections = course?.numberOfSections ?? 0
        self.numberOfHours = course?.numberOfHours ?? 0
        self.colors = course?.colors ?? ["#0279FF", "#4FA3FF"]
        self.illustration = course?.illustration?.url ?? ""
        self.sectionCollection = SectionsCollection(course?.sectionCollection)
    }
    
}

struct SectionsCollection : Decodable {
    
    let sections : [Section]
    
    init(_ sectionsCollection : CourseData.Course.SectionCollection?) {
        self.sections = sectionsCollection?.sections.map({ section -> Section in
            Section(section)
        }) ?? []
    }
    
    struct Section : Identifiable, Decodable {
        let id : String
        let title : String
        let subtitle : String
        let content : String
        
        init(_ section : CourseData.Course.SectionCollection.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
            self.subtitle = section?.subtitle ?? ""
            self.content = section?.content ?? ""
        }
    }
    
}
