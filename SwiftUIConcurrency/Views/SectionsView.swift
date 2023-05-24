//
//  SectionsView.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import SwiftUI

struct SectionsView: View {
    
    @EnvironmentObject var sectionViewModel : SectionViewModel
    
    @Environment(\.isSearching) var isSearching
    
    var body: some View {
        VStack {
            if isSearching {
                if sectionViewModel.filteredSections.count > 0 {
                    //Display filtered list
                    List(sectionViewModel.sections) { section in
                        Text(section.title)
                    }
                } else {
                    List(0..<1) {_ in
                        Text("No Results")
                    }
                    
                }
            } else {
                SectionList()
            }
            
            
        }
        .navigationTitle("All Sections")
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView()
            .environmentObject(SectionViewModel())
    }
}
