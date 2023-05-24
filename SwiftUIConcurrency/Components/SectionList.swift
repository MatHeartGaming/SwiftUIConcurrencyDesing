//
//  SectionList.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import SwiftUI

struct SectionList: View {
    
    @EnvironmentObject var sectionViewModel : SectionViewModel
    
    var body: some View {
        List {
            ForEach($sectionViewModel.sections, id: \.id) { $section in
                HStack {
                    Text(section.title)
                    Spacer()
                    if section.isPinned {
                        Image(systemName: "pin.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        section.isPinned.toggle()
                        sectionViewModel.orderSectionsByPinnes()
                    } label: {
                        if section.isPinned {
                            Label("Unpin", systemImage: "pin.slash")
                        } else {
                            Label("Pin", systemImage: "pin")
                        }
                    }
                    
                }
                .tint(.yellow)
            }
        }
        .task {
            await sectionViewModel.fetch()
        }
        .refreshable {
            //Shuffle List
            await sectionViewModel.randomizedSections()
        }
    }
}

struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        SectionList()
            .environmentObject(SectionViewModel())
    }
}
