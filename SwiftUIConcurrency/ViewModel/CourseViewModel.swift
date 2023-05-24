//
//  CourseViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation
import Apollo

enum FeaturedSubject : String, CaseIterable {
    case SwiftUI = "SwiftUI"
    case Desing = "Desing"
}

class CourseViewModel : ObservableObject {
    
    @Published public private(set) var courses = [Course]()
    @Published public private(set) var featuredCourses = [Course]()
    
    var featuredSubject : FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .SwiftUI
    
    private let apollo = Network.shared.apollo
    
    private func queryCourses() async throws -> GraphQLResult<CourseQuery.Data>? {
        return await withCheckedContinuation({ continuation in
            apollo.fetch(query: CourseQuery()) {result in
                switch result {
                case .success(let grapghQLResult):
                    continuation.resume(returning: grapghQLResult)
                    print("Successfully got a GraphQL result \(grapghQLResult)")
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                    print("Network or response format error \(error.localizedDescription)")
                }
            }
        })
    }
    
    func fetch() async {
        do {
            let result = try await queryCourses()
            if let result = result {
                if let courseCollection = result.data?.courseCollection {
                    DispatchQueue.main.async { [self] in
                        self.courses = self.process(data: courseCollection)
                        findFeaturedCourses()
                    }
                }
            }
        } catch {
            print("Error", error)
        }
    }
    
    private func process(data : CourseData) -> [Course] {
        let content = CoursesCollection.init(data)
        return content.courses
    }
    
    private func findFeaturedCourses() {
        guard !courses.isEmpty else {return}
        
        self.featuredCourses = courses.filter { course in
            course.subject == featuredSubject.rawValue
        }
    }
    
}
