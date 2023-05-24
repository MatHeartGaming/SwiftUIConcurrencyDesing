//
//  ContentView.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var courseViewModel : CourseViewModel
    @EnvironmentObject var sectionViewModel : SectionViewModel
    
    @StateObject var modalManager = ModalManager()
    
    @State private var text = ""
    
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .environmentObject(modalManager)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Learn Now")
                    }
                
                NavigationView {
                    SectionsView()
                }
                .searchable(text: $text) {
                    ForEach(sectionViewModel.sections.prefix(3)) { section in
                        Text(section.title)
                            .searchCompletion(section.title)
                    }
                }
                .onChange(of: text, perform: { newValue in
                    print("Text to search: \(text)")
                    sectionViewModel.filterSections(for: newValue)
                })
                .onSubmit(of: .search) {
                    print("Text to search: \(text)")
                    sectionViewModel.filterSections(for: text)
                }
                .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Sections")
                }
                
                AccountView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Account")
                    }
                
            }
            .task {
                await courseViewModel.fetch()
            }
            
            if modalManager.showModal {
                ModalManagerView()
                    .environmentObject(modalManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
            .environmentObject(SectionViewModel())
    }
}
