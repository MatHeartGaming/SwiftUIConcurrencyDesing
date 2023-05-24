//
//  HomeView.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 23/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var courseViewModel : CourseViewModel
    @EnvironmentObject var modalManager : ModalManager
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        DateTitle(title: "Learn \(courseViewModel.featuredSubject)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 20)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        ProfileIcon()
                            .onTapGesture {
                                withAnimation {
                                    modalManager.showModal.toggle()
                                }
                            }
                    }
                    .padding(.horizontal, 20)
                    
                    
                    FeaturedCourseList(featuredCourses: courseViewModel.featuredCourses)
                        .padding(.top, 20)
                    
                    Text("All Courses")
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                    
                    CourseList(courses: courseViewModel.courses)
                        .padding(.top, 20)
                }
            }
            
            Color.white
                .animation(.easeIn)
                .ignoresSafeArea()
                .frame(height: 0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CourseViewModel())
            .environmentObject(ModalManager())
    }
}
